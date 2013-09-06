class CreateMaintenanceCompanies < ActiveRecord::Migration
  def change
    create_table :maintenance_companies do |t|
      t.references :user
      t.references :cemetery
      t.string :name
      t.string :email
      t.string :address      
      t.string :suburb_town
      t.string :state
      t.string :postal_code
      t.string :phone_area_code
      t.string :phone
      t.string :fax_area_code
      t.string :fax
      t.string :mobile
      t.string   "work_email"
      t.string   "work_number"      
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end
end
