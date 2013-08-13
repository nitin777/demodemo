class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :cemetery
      t.references :area
      t.string   "section_code"
      t.string   "section_name"
      t.integer  "first_grave"
      t.integer  "last_grave"
      t.string   "section_user"
      t.string   "section_map_path"
      t.boolean  "is_active",                  default: true
      t.timestamps
    end
  end
end
