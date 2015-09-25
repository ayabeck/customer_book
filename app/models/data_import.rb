class DataImport
  include ActiveModel::Model

  attr_accessor :file, :model

  def save
    if imported_data.map(&:valid?).all?
      ActiveRecord::Base.transaction do
        imported_data.each(&:save!)
      end
      true
    else
      imported_data.each_with_index do |data, index|
        data.errors.full_messages.each do |message|
          errors.add :base, "#{index+3}行目: #{message}"
        end
      end
      false
    end
  end

  def imported_data
    @imported_data ||= load_imported_data
  end

  def load_imported_data
    spreadsheet = open_spreadsheet
    # １行目は補足用headerなので読み捨て
    header = spreadsheet.row(2)
    (3..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      data = model.find_by_id(row["id"]) || model.new
      data.attributes = row.to_hash.slice(*model.allowed_attributes)
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
        raise "Unknown file type: #{file.original_filename}"
    end
  end
end