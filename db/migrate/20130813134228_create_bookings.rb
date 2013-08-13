class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user
      t.references :grave
      t.references :gratee
      t.references :service_type
      t.boolean  "is_private",                            default: false
      t.integer  "funeral_director_id"
      t.string   "d_title"
      t.string   "d_surname"
      t.string   "d_first_name"
      t.string   "d_middle_name"
      t.string   "d_gender"      
      t.integer  "d_country_id_death"
      t.string   "d_place_of_death"
      t.date     "d_date_death"
      t.integer  "d_country_id_birth"
      t.string   "d_place_birth"
      t.date     "d_date_birth"
      t.integer  "d_age"
      t.string   "d_finageuom"
      t.string   "d_address"
      t.string   "d_suburb"
      t.string   "d_state"
      t.string   "d_postal_code"
      t.integer  "d_country_id"
      t.string   "d_marital_status"
      t.string   "d_partner_name"
      t.string   "d_partner_surname"
      t.string   "d_father_name"
      t.string   "d_father_surname"
      t.string   "d_mother_name"
      t.string   "d_mother_maiden_surname"
      t.references :disease
      t.string   "i_title"
      t.string   "i_surname"
      t.string   "i_first_name"
      t.string   "i_middle_name"
      t.string   "i_fax_area_code"
      t.string   "i_fax"
      t.string   "i_email"
      t.string   "i_telephone_area_code"
      t.string   "i_telephone"
      t.string   "i_mobile"
      t.string   "i_address"
      t.string   "i_suburb"
      t.string   "i_state"
      t.string   "i_postal_code"
      t.integer  "i_country_id"      
      t.string   "relationship_to_deceased"
      t.date     "date_notified"
      t.datetime "service_date1"
      t.datetime "service_date2"
      t.datetime "service_date3"
      t.string   "monument"
      t.string   "monuments_grave_position"
      t.integer  "monuments_unit_type"
      t.integer  "monuments_depth"
      t.integer  "monuments_width"
      t.integer  "monuments_length"
      t.string   "grantee_relationship"
      
      t.references :coffin
      t.integer  "coffin_length"
      t.integer  "coffin_width"
      t.integer  "coffin_height"
      t.references :unit_type
      t.boolean  "death_certificate",              default: true
      t.boolean  "own_clergy",                     default: true
      t.boolean  "coffin_surcharge",               default: true
      t.string   "clergy_name"
      t.references :chapel
      t.datetime "chapel_time_from"
      t.datetime "chapel_time_to"
      t.references :room
      t.datetime "room_time_from"
      t.datetime "room_time_to"      
      t.string   "burning_drum"
      t.string   "fireworks"
      t.string   "lowering_device"
      t.string   "balloons"
      t.string   "chapel_multimedia"
      t.string   "special_instruction"
      t.string   "ceremonial_sand"
      t.string   "receipt_number"
      t.string   "canopy"
      t.integer  "cost"
      t.text     "notes" 
      t.text     "comment1"
      t.text     "comment2"
      t.datetime "interment_date"
      t.boolean  "is_finalized",                          default: false
      t.timestamps
    end
  end
end
