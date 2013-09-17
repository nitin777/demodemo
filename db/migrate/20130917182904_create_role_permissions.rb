class CreateRolePermissions < ActiveRecord::Migration
  def change
    create_table :role_permissions do |t|
      t.references :cemetery
      t.references :role
      t.boolean :user_access, :default => true
      t.boolean :cemetery_access, :default => true
      t.boolean :booking_access, :default => true
      t.boolean :maintenance_access, :default => true
      t.timestamps
    end
  end
end
