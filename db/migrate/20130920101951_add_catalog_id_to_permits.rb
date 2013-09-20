class AddCatalogIdToPermits < ActiveRecord::Migration
  def change
    add_column :permits, :catalog_id, :integer, :after => :grantee_id
    add_column :permits, :quantity, :string, :after => :catalog_id
    add_column :permits, :total_charge, :integer, :default => 0, :after => :quantity
  end
end
