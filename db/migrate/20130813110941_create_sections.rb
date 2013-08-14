class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :cemetery
      t.references :area
      t.string   "code"
      t.string   "name"
      t.integer  "first_grave"
      t.integer  "last_grave"
      t.string   "user"
      t.string   "map_path"
      t.boolean  "is_active",                  default: true
      t.timestamps
    end
  end
end
