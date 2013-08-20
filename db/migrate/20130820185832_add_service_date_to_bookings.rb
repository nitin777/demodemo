class AddServiceDateToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :service_date, :date
    add_column :bookings, :service_time_from, :time
    add_column :bookings, :service_time_to, :time
  end
end
