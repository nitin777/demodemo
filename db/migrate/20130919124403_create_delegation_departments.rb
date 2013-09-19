class CreateDelegationDepartments < ActiveRecord::Migration
  def change
    create_table :delegation_departments do |t|
      t.references :cemetery
      t.string :name
      t.string :contact_number
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end
end
