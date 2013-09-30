class ChangeColumnTypeToCatalogs < ActiveRecord::Migration
  def change
    change_column :catalogs, :cost_price, :string
    change_column :catalogs, :special_cost_price, :string
    
    change_column :payments, :amount, :string
    change_column :payments, :total_amount, :string
    
    change_column :facilities, :chapel_cost, :string
    change_column :facilities, :room_cost, :string
    
  end
end
