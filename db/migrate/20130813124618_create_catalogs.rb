class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.references :cemetery
      t.string   "name"
      t.text   "description"
      t.float    "cost_price"
      t.float    "special_cost_price"
      t.boolean  "is_active",                     default: true
      t.timestamps
    end
  end
end
