class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.references :cemetery
      t.references :user
      t.string   "title"
      t.string   "first_name"
      t.string   "middle_name"
      t.string   "surname"
      t.text     "address"
      t.string   "email"
      t.string   "state"
      t.string   "town"
      t.string   "postal_code"
      t.string   "phone_area_code"
      t.string   "phone"
      t.string   "fax_area_code"
      t.string   "fax"
      t.string   "chapel_ids"
      t.datetime "chapel_time_from"
      t.datetime "chapel_time_to"
      t.integer  "chapel_cost"
      t.string   "room_ids"
      t.datetime "room_time_from"
      t.datetime "room_time_to"
      t.integer  "no_of_rooms"
      t.integer  "room_cost"
      t.string   "special_instruction"
      t.string   "receipt_number"
      t.boolean  "is_finalized", :default => false
      t.timestamps
    end
  end
end
