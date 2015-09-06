class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.text :summary
      t.date :date_on

      t.timestamps null: false
    end
  end
end
