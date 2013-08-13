class CreateBookingChecklists < ActiveRecord::Migration
  def change
    create_table :booking_checklists do |t|
      t.references :booking
      t.string   "file_location"
      t.integer   "cemetery_application",           default: 3
      t.integer   "burial_booking_form",            default: 3
      t.integer   "ashes_booking_form",             default: 3
      t.integer   "exhumation_booking_from",        default: 3
      t.integer   "remains_booking_from",           default: 3
      t.integer   "health_order",                   default: 3
      t.integer   "court_order",                    default: 3
      t.integer   "checked_fnd_details",            default: 3
      t.integer   "checked_owner_grave",            default: 3
      t.integer   "living_grave_owner",             default: 3
      t.integer   "deceased_grave_owner",           default: 3
      t.integer   "cecked_chapel_booking",          default: 3
      t.integer   "advised_fd_to_check",            default: 3
      t.integer   "advised_fd_recommended",         default: 3
      t.integer   "advised_fd_coffin_height",       default: 3
      t.integer   "medical_death_certificate",      default: 3
      t.integer   "medical_certificate_spelling",   default: 3
      t.integer   "medical_certificate_infectious", default: 3
      t.integer   "request_probe_reopen",           default: 3
      t.integer   "request_triple_depth_reopen",    default: 3
      t.integer   "checked_monumental",             default: 3
      t.integer   "contacted_stonemason",           default: 3
      t.integer   "checked_accessories",            default: 3
      t.integer   "balloons_na",                    default: 3
      t.integer   "burning_drum",                   default: 3
      t.integer   "canopy",                         default: 3
      t.integer   "ceremonial_sand_bucket",         default: 3
      t.integer   "fireworks",                      default: 3
      t.integer   "lowering_device",                default: 3
      t.integer   "checked_returned_signed",        default: 3
      t.integer   "check_coffin_sizes_surcharge",   default: 3
      t.integer   "surcharge_applied",              default: 3
      t.integer   "compare_burial_booking",         default: 3
      t.integer   "for_between_burials",            default: 3
      t.integer   "double_check_yellow_date",       default: 3
      t.text     "other"
      t.timestamps
    end
  end
end
