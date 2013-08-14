class CreateGraves < ActiveRecord::Migration
  def change
    create_table :graves do |t|
      t.references :cemetery
      t.references :area
      t.references :section
      t.references :row 
      t.references :plot
      t.references :grave_status
      t.references :stonemason
      t.string   "grave_number"
      t.string   "image_1"
      t.string   "image_2"
      t.string   "length"
      t.string   "width"
      t.string   "height"
      t.references :unit_type
      t.text     "details"
      t.string   "monument"
      t.string   "monuments_grave_position"
      t.integer  "monuments_unit_type_id"
      t.string   "monuments_depth"
      t.string   "monuments_width"
      t.string   "monuments_length"
      t.string   "latitude"
      t.string   "longitude"
      t.text     "comment_1"
      t.text     "comment_2"
      t.boolean  "is_active",                          default: true
      t.timestamps
    end
  end
end
