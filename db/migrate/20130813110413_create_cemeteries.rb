class CreateCemeteries < ActiveRecord::Migration
  def change
    create_table :cemeteries do |t|
      t.references :country
      t.string   "name"
      t.text     "description"
      t.string   "url"
      t.string   "address"
      t.string   "suburb_town"
      t.string   "state"
      t.string   "postcode"
      t.string   "area_code"
      t.string   "phone"
      t.string   "fax_area_code"
      t.string   "fax"
      t.string   "email"
      t.string   "gmap_code",         limit: 2000
      t.string   "cemetery_map_path"
      t.string   "latitude"
      t.string   "longitude"
      t.boolean  "is_active",                     default: true
      t.timestamps
    end
  end
end
