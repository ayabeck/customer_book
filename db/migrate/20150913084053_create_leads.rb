class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :company_name
      t.string :department
      t.string :title
      t.string :name
      t.string :email
      t.string :phone
      t.date :date_on
      t.string :trigger
      t.text :memo

      t.timestamps null: false
    end
  end
end
