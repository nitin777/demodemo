class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.references :user
      t.references :cemetery
      t.references :area
      t.references :section
      t.references :row
      t.references :plot
      t.references :grafe
      t.string   "interred_name"
      t.string   "interred_surname"      
      t.text "operational_notes"
      
      t.text "notes"
      t.boolean  "cancelled", default: false
      t.date     "cancelled_date"
      t.boolean  "send_invoice", default: false
      t.timestamps
    end
  end
end
