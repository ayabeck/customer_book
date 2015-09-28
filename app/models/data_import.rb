class DataImport
  include ActiveModel::Model

  attr_accessor :file, :target_model, :parent_instance

  validates :target_model, presence: true
  validate  :validate_file_select
  validate  :validate_extension, if: 'file.present?'

  define_model_callbacks :save
  before_save { self.valid? }

  ALLOWED_EXTENSION = %w(.csv .xlsx).freeze
  DENY_ATTRIBUTES = %w(created_at updated_at event_id lead_id).freeze

  def self.importable_attributes(model)
    columns = model.column_names
    columns.delete_if{ |column| DENY_ATTRIBUTES.include?(column) }
    columns
  end

  def init(target_model, parent_instance = nil)
    self.target_model = target_model
    self.parent_instance = parent_instance
  end

  # saveの前に init を実行する必要がある
  def save
    run_callbacks :save do
      if imported_data.map(&:valid?).all?
        ActiveRecord::Base.transaction do
          imported_data.each(&:save!)
        end
        true
      else
        imported_data.each_with_index do |data, index|
          data.errors.full_messages.each do |message|
            errors.add :base, "#{ index+3 }行目: #{ message }"
          end
        end
        false
      end
    end
  end

  private
    def imported_data
      @imported_data ||= load_imported_data
    end

    def load_imported_data
      spreadsheet = open_spreadsheet
      # １行目は補足用headerなので読み捨て
      header = spreadsheet.row(2)
      (3..spreadsheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        data = target_model.find_by_id(row['id']) || target_model.new
        data.attributes = row.to_hash.slice(*DataImport.importable_attributes(target_model))
        if parent_instance
          data.attributes = Hash["#{parent_instance.class.to_s.downcase}_id".to_sym, parent_instance.id]
        end
        data
      end
    end

    def open_spreadsheet
      case File.extname(file.original_filename)
        when '.csv' then
          Roo::Spreadsheet.open(file.path, extension: :csv)
        when '.xlsx' then
          Roo::Spreadsheet.open(file.path, extension: :xlsx)
        else
          raise "Unknown file type: #{ file.original_filename }"
      end
    end

    def validate_file_select
      if file.blank?
        errors.add :base, I18n.t('errors.messages.blank_file')
      end
    end

    def validate_extension
      extname = File.extname(file.original_filename).downcase
      unless ALLOWED_EXTENSION.include?(extname)
        errors.add :base, '「.csv」または「.xlsx」のファイルを選択してください。'
      end
    end
end