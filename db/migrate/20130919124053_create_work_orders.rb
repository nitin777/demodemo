class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.references :cemetery
      t.references :area
      t.references :section
      t.references :row
      t.references :plot
      t.references :grafe

      t.string   "title"
      t.string   "first_name"
      t.string   "middle_name"
      t.string   "surname"
      t.text     "address"
      t.string   "email"
      t.string   "state"
      t.string   "town"
      t.string   "postal_code"
      t.string   "phone_area_code"
      t.string   "phone"
      t.string   "fax_area_code"
      t.string   "fax"
      t.text     "customer_notes"      
      
      t.references :delegation_department
      t.text     "description"
      t.references :work_type
      t.date     "work_date"
      t.date     "completion_date"
      t.integer  "completed_user_id"
      t.references :catalog
      t.string   "receipt_number"
      t.boolean   :is_completed, :default => false

      t.timestamps
    end
  end
end
