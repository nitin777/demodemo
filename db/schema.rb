# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130908075322) do

  create_table "areas", force: true do |t|
    t.integer  "cemetery_id"
    t.string   "code"
    t.text     "description"
    t.string   "control_number"
    t.string   "name"
    t.string   "user"
    t.string   "map"
    t.boolean  "is_active",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "booking_checklists", force: true do |t|
    t.integer  "booking_id"
    t.string   "file_location"
    t.integer  "cemetery_application",           default: 3
    t.integer  "burial_booking_form",            default: 3
    t.integer  "ashes_booking_form",             default: 3
    t.integer  "exhumation_booking_from",        default: 3
    t.integer  "remains_booking_from",           default: 3
    t.integer  "health_order",                   default: 3
    t.integer  "court_order",                    default: 3
    t.integer  "checked_fnd_details",            default: 3
    t.integer  "checked_owner_grave",            default: 3
    t.integer  "living_grave_owner",             default: 3
    t.integer  "deceased_grave_owner",           default: 3
    t.integer  "cecked_chapel_booking",          default: 3
    t.integer  "advised_fd_to_check",            default: 3
    t.integer  "advised_fd_recommended",         default: 3
    t.integer  "advised_fd_coffin_height",       default: 3
    t.integer  "medical_death_certificate",      default: 3
    t.integer  "medical_certificate_spelling",   default: 3
    t.integer  "medical_certificate_infectious", default: 3
    t.integer  "request_probe_reopen",           default: 3
    t.integer  "request_triple_depth_reopen",    default: 3
    t.integer  "checked_monumental",             default: 3
    t.integer  "contacted_stonemason",           default: 3
    t.integer  "checked_accessories",            default: 3
    t.integer  "balloons_na",                    default: 3
    t.integer  "burning_drum",                   default: 3
    t.integer  "canopy",                         default: 3
    t.integer  "ceremonial_sand_bucket",         default: 3
    t.integer  "fireworks",                      default: 3
    t.integer  "lowering_device",                default: 3
    t.integer  "checked_returned_signed",        default: 3
    t.integer  "check_coffin_sizes_surcharge",   default: 3
    t.integer  "surcharge_applied",              default: 3
    t.integer  "compare_burial_booking",         default: 3
    t.integer  "for_between_burials",            default: 3
    t.integer  "double_check_yellow_date",       default: 3
    t.text     "other"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings", force: true do |t|
    t.integer  "cemetery_id"
    t.integer  "user_id"
    t.integer  "area_id"
    t.integer  "section_id"
    t.integer  "row_id"
    t.integer  "plot_id"
    t.integer  "grafe_id"
    t.integer  "grantee_id"
    t.integer  "service_type_id"
    t.integer  "catalog_id"
    t.integer  "payment_status_id"
    t.string   "consultant"
    t.boolean  "is_private",                     default: false
    t.boolean  "is_confirmed",                   default: false
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
    t.integer  "disease_id"
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
    t.integer  "monument_id"
    t.string   "grantee_relationship"
    t.integer  "coffin_id"
    t.integer  "coffin_length"
    t.integer  "coffin_width"
    t.integer  "coffin_height"
    t.integer  "unit_type_id"
    t.boolean  "death_certificate",              default: true
    t.boolean  "own_clergy",                     default: true
    t.boolean  "coffin_surcharge",               default: true
    t.string   "clergy_name"
    t.string   "chapel_ids"
    t.datetime "chapel_time_from"
    t.datetime "chapel_time_to"
    t.string   "room_ids"
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
    t.boolean  "is_finalized",                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "service_date"
    t.time     "service_time_from"
    t.time     "service_time_to"
  end

  create_table "catalogs", force: true do |t|
    t.integer  "cemetery_id"
    t.string   "name"
    t.text     "description"
    t.float    "cost_price"
    t.float    "special_cost_price"
    t.boolean  "is_active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cemeteries", force: true do |t|
    t.integer  "country_id"
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "address"
    t.string   "suburb_town"
    t.string   "state"
    t.string   "postal_code"
    t.string   "phone_area_code"
    t.string   "phone"
    t.string   "fax_area_code"
    t.string   "fax"
    t.string   "email"
    t.text     "gmap_code"
    t.string   "map"
    t.string   "latitude"
    t.string   "longitude"
    t.boolean  "is_active",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapels", force: true do |t|
    t.integer  "cemetery_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charges", force: true do |t|
    t.string   "work_type"
    t.float    "fee"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coffins", force: true do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "denominations", force: true do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diseases", force: true do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilities", force: true do |t|
    t.integer  "cemetery_id"
    t.integer  "user_id"
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
    t.boolean  "is_finalized",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grantee_graves", force: true do |t|
    t.integer  "user_id"
    t.integer  "grantee_id"
    t.integer  "area_id"
    t.integer  "section_id"
    t.integer  "row_id"
    t.integer  "plot_id"
    t.integer  "grafe_id"
    t.integer  "identity_id"
    t.integer  "catalog_id"
    t.integer  "payment_status_id"
    t.string   "grantee_identity_number"
    t.string   "receipt_number"
    t.string   "control_number"
    t.string   "invoice_number"
    t.date     "date_of_purchase"
    t.integer  "cost"
    t.date     "tenure_expiry_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grantees", force: true do |t|
    t.integer  "cemetery_id"
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "surname"
    t.string   "grantee_unique_id"
    t.integer  "denomination_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grave_statuses", force: true do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "graves", force: true do |t|
    t.integer  "cemetery_id"
    t.integer  "area_id"
    t.integer  "section_id"
    t.integer  "row_id"
    t.integer  "plot_id"
    t.integer  "grave_status_id"
    t.integer  "stone_mason_id"
    t.integer  "monument_id"
    t.string   "grave_number"
    t.string   "image_1"
    t.string   "image_2"
    t.string   "length"
    t.string   "width"
    t.string   "height"
    t.integer  "unit_type_id"
    t.text     "details"
    t.string   "latitude"
    t.string   "longitude"
    t.boolean  "is_active",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "letter_variables", force: true do |t|
    t.text     "content"
    t.boolean  "is_certificate", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "letters", force: true do |t|
    t.integer  "cemetery_id"
    t.string   "subject"
    t.text     "content"
    t.boolean  "is_certificate", default: false
    t.string   "letter_type"
    t.boolean  "is_active",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenance_companies", force: true do |t|
    t.integer  "user_id"
    t.integer  "cemetery_id"
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "suburb_town"
    t.string   "state"
    t.string   "postal_code"
    t.string   "phone_area_code"
    t.string   "phone"
    t.string   "fax_area_code"
    t.string   "fax"
    t.string   "mobile"
    t.string   "work_email"
    t.string   "work_number"
    t.boolean  "is_active",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenances", force: true do |t|
    t.integer  "user_id"
    t.integer  "cemetery_id"
    t.integer  "area_id"
    t.integer  "section_id"
    t.integer  "row_id"
    t.integer  "plot_id"
    t.integer  "grafe_id"
    t.string   "interred_name"
    t.string   "interred_surname"
    t.text     "operational_notes"
    t.text     "notes"
    t.boolean  "cancelled",         default: false
    t.date     "cancelled_date"
    t.boolean  "send_invoice",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monuments", force: true do |t|
    t.integer  "cemetery_id"
    t.string   "name"
    t.string   "grave_position"
    t.string   "depth"
    t.string   "width"
    t.string   "length"
    t.integer  "unit_type_id"
    t.text     "comment_1"
    t.text     "comment_2"
    t.boolean  "is_active",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_statuses", force: true do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permit_charges", force: true do |t|
    t.integer  "permit_id"
    t.integer  "charge_id"
    t.integer  "quantity"
    t.float    "fee"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permits", force: true do |t|
    t.integer  "user_id"
    t.integer  "cemetery_id"
    t.integer  "stonemason_id"
    t.string   "permit_number"
    t.string   "phone_number"
    t.datetime "received_date"
    t.string   "received_by"
    t.integer  "area_id"
    t.integer  "section_id"
    t.integer  "row_id"
    t.integer  "plot_id"
    t.integer  "grafe_id"
    t.integer  "booking_id"
    t.string   "deceased_surname"
    t.string   "deceased_first_name"
    t.date     "deceased_date_death"
    t.integer  "deceased_age"
    t.integer  "grantee_id"
    t.text     "comment"
    t.boolean  "checklist_received",  default: false
    t.boolean  "paperwork_correct",   default: false
    t.boolean  "paperwork_return",    default: false
    t.boolean  "is_active",           default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plots", force: true do |t|
    t.integer  "cemetery_id"
    t.integer  "area_id"
    t.integer  "section_id"
    t.integer  "row_id"
    t.string   "name"
    t.string   "user"
    t.string   "length"
    t.string   "width"
    t.string   "depth"
    t.string   "map"
    t.boolean  "is_active",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "role_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.integer  "cemetery_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rows", force: true do |t|
    t.integer  "cemetery_id"
    t.integer  "area_id"
    t.integer  "section_id"
    t.string   "name"
    t.string   "user"
    t.string   "map"
    t.boolean  "is_active",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "cemetery_id"
    t.integer  "area_id"
    t.string   "code"
    t.string   "name"
    t.integer  "first_grave"
    t.integer  "last_grave"
    t.string   "user"
    t.string   "map"
    t.boolean  "is_active",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_types", force: true do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "static_pages", force: true do |t|
    t.string   "name"
    t.string   "page_route"
    t.text     "content"
    t.boolean  "is_footer",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stone_mason_work_types", force: true do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stone_masons", force: true do |t|
    t.integer  "cemetery_id"
    t.integer  "stone_mason_work_type_id"
    t.string   "bond"
    t.string   "annual_license_fee"
    t.string   "abn_acn_number"
    t.string   "contractors_license_number"
    t.string   "general_induction_cards"
    t.string   "operator_licenses"
    t.string   "list_current_employees"
    t.string   "list_contractors"
    t.boolean  "is_active",                  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_types", force: true do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", force: true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "title"
    t.string   "surname"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "country_id"
    t.integer  "cemetery_id"
    t.string   "organization"
    t.text     "address"
    t.text     "suburb_town"
    t.string   "state"
    t.string   "postal_code"
    t.string   "phone_area_code"
    t.string   "phone"
    t.string   "fax_area_code"
    t.string   "fax"
    t.string   "image"
    t.string   "register_token"
    t.integer  "login_count",        default: 0,    null: false
    t.integer  "failed_login_count", default: 0,    null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "is_active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
