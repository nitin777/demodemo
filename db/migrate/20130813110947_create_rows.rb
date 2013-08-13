class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.references :cemetery
      t.references :area
      t.references :section
      t.string   "row_name"
      t.string   "row_user"
      t.string   "row_map_path"
      t.boolean  "is_active",                 default: true
      t.timestamps
    end
  end
end
