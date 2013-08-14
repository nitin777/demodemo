class CreateGrantees < ActiveRecord::Migration
  def change
    create_table :grantees do |t|
      t.references :cemetery
      t.string   "title"
      t.string   "first_name"
      t.string   "middle_name"
      t.string   "surname"
      t.string   "grantee_unique_id"
      t.references :denomination
      t.text     "address"
      t.string   "email"
      t.string   "state"
      t.string   "town"
      t.string   "postal_code"
      t.string   "phone_area_code"
      t.string   "phone"
      t.string   "fax_area_code"
      t.string   "fax"
      t.date     "date_of_birth"
      t.string   "remarks_1"
      t.string   "remarks_2"
      t.timestamps
    end
  end
end
