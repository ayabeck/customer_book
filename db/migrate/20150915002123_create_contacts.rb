class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.date :date_on
      t.text :content
      t.string :means
      t.string :owner
      t.references :lead, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
