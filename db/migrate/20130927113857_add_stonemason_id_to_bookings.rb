class AddStonemasonIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :stonemason_id, :integer
  end
end
