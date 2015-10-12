module CsvHelper
  class SendCSV
    # 使用するコントローラでインクルードする
    #   include CsvHelper
    # コントローラで呼び出して使用する
    #   format.csv { SendCSV.new(@leads, self) }
    #     →Leads_2015-10-12.csv
    # 親インスタンスに紐づくデータを出力する場合
    #   format.csv { SendCSV.new(@event.leads, self, @event) }
    #     →Event1_Leads_2015-10-12.csv
    def initialize(instance, controller, parent_instance = nil)
      @instance   = instance
      @model      = controller.controller_name.classify.constantize
      @controller = controller
      @parent     = parent_instance
      send_csv
    end

    private
      def send_csv
        @controller.send_data(render_csv, filename: csv_filename, type: 'text/csv; charset=UTF-8;')
      end

      def render_csv
        columns = DataImport.importable_attributes(@model)
        headers = columns.map { |column| @model.human_attribute_name(column.to_sym) }
        # Column descriptions in a first row
        options = { headers: headers, write_headers: true }

        csv_data = CSV.generate(options) do |csv|
          # Column names in a second row
          csv << columns
          @instance.each do |row|
            csv << row.attributes.values_at(*columns)
          end
        end

        # Add BOM to open Excel
        bom = "   "
        bom.setbyte(0, 0xEF)
        bom.setbyte(1, 0xBB)
        bom.setbyte(2, 0xBF)
        bom + csv_data
      end

      def csv_filename
        filename = "#{ @instance.model_name.to_s.pluralize }_#{ Time.zone.today.to_s }.csv"
        @parent ? "#{ @parent.class.to_s }#{ @parent.id }_".concat(filename) : filename
      end
  end
end