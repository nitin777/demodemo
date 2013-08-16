class CreateGraves < ActiveRecord::Migration
  def change
    create_table :graves do |t|
      t.references :cemetery
      t.references :area
      t.references :section
      t.references :row 
      t.references :plot
      t.references :grave_status
      t.references :stone_mason
      t.references :monument
      t.string   "grave_number"
      t.string   "image_1"
      t.string   "image_2"
      t.string   "length"
      t.string   "width"
      t.string   "height"
      t.references :unit_type
      t.text     "details"
      t.string   "latitude"
      t.string   "longitude"
      t.boolean  "is_active",                          default: true
      t.timestamps
    end
  end
end
