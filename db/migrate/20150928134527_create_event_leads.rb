class CreateEventLeads < ActiveRecord::Migration
  def change
    create_table :event_leads do |t|
      t.references :event, index: true, foreign_key: true
      t.references :lead, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
