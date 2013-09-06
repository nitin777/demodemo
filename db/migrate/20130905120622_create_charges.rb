class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string  "work_type"
      t.float   "fee"
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end
end
