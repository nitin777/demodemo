class CreatePermits < ActiveRecord::Migration
  def change
    create_table :permits do |t|
      t.references :user
      t.references :cemetery
      t.integer :stonemason_id
      t.string   "permit_number"
      t.string   "phone_number"
      t.datetime "received_date"
      t.string   "received_by"
      t.references :area
      t.references :section
      t.references :row
      t.references :plot
      t.references :grafe
      t.references :booking
      t.string   "deceased_surname"
      t.string   "deceased_first_name"
      t.date     "deceased_date_death"
      t.integer  "deceased_age"
      t.references :grantee
      t.text     "comment"
      t.boolean   "checklist_received", :default => false
      t.boolean   "paperwork_correct", :default => false
      t.boolean   "paperwork_return", :default => false
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end
end
