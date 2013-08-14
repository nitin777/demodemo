class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.references :cemetery
      t.references :area
      t.references :section
      t.string   "name"
      t.string   "user"
      t.string   "map"
      t.boolean  "is_active",                 default: true
      t.timestamps
    end
  end
end
