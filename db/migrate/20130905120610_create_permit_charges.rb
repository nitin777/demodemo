class CreatePermitCharges < ActiveRecord::Migration
  def change
    create_table :permit_charges do |t|
      t.references :permit
      t.references :charge
      t.integer "quantity"
      t.float   "charge"
      t.timestamps
    end
  end
end
