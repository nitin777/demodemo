class AddCategoryIdToCatalogs < ActiveRecord::Migration
  def change
    add_column :catalogs, :category_id, :integer, :after => :cemetery_id
  end
end
