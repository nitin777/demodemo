class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.references :cemetery
      t.string   "area_code"
      t.text     "area_description"
      t.string   "area_control_number"
      t.string   "area_name"
      t.string   "area_user"
      t.string   "area_map_path"
      t.boolean  "is_active",                      default: true
      t.timestamps
    end
  end
end
