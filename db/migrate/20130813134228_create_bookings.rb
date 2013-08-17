class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :cemetery      
      t.references :user
      t.references :area
      t.references :section
      t.references :row
      t.references :plot
      t.references :grafe
      t.references :gratee
      t.references :service_type
      t.references :catalog
      t.references :payment_status
      t.string   "consultant"
      t.boolean  "is_private",                            default: false
      t.boolean  "is_confirmed",                            default: false
      t.integer  "funeral_director_id"
      t.string   "deceased_title"
      t.string   "deceased_surname"
      t.string   "deceased_first_name"
      t.string   "deceased_middle_name"
      t.string   "deceased_gender"      
      t.integer  "deceased_country_id_death"
      t.string   "deceased_place_of_death"
      t.date     "deceased_date_death"
      t.integer  "deceased_country_id_birth"
      t.string   "deceased_place_birth"
      t.date     "deceased_date_birth"
      t.integer  "deceased_age"
      t.string   "deceased_finageuom"
      t.string   "deceased_address"
      t.string   "deceased_suburb"
      t.string   "deceased_state"
      t.string   "deceased_postal_code"
      t.integer  "deceased_country_id"
      t.string   "deceased_marital_status"
      t.string   "deceased_partner_name"
      t.string   "deceased_partner_surname"
      t.string   "deceased_father_name"
      t.string   "deceased_father_surname"
      t.string   "deceased_mother_name"
      t.string   "deceased_mother_maiden_surname"
      t.references :disease
      t.string   "informant_title"
      t.string   "informant_surname"
      t.string   "informant_first_name"
      t.string   "informant_middle_name"
      t.string   "informant_fax_area_code"
      t.string   "informant_fax"
      t.string   "informant_email"
      t.string   "informant_telephone_area_code"
      t.string   "informant_telephone"
      t.string   "informant_mobile"
      t.string   "informant_address"
      t.string   "informant_suburb"
      t.string   "informant_state"
      t.string   "informant_postal_code"
      t.integer  "informant_country_id"      
      t.string   "relationship_to_deceased"
      t.date     "date_notified"
      t.datetime "service_date1"
      t.datetime "service_date2"
      t.datetime "service_date3"
      t.references :monument
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
