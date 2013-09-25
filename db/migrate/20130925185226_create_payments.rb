class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :paymentable_id
      t.string :paymentable_type
      t.references :catalog
      t.integer :quantity, :default => 1
      t.integer :amount, :default => 0
      t.integer :total_amount, :default => 0
      t.timestamps
    end
  end
end
