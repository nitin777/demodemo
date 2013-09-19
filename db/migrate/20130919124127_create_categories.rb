class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :cemetery
      t.string :name
      t.integer :parent_category_id
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end
end
