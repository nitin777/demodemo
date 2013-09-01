class ChangeColumnTypeBookings < ActiveRecord::Migration
  def self.up
    rename_column :bookings, :chapel_id, :chapel_ids
    rename_column :bookings, :room_id, :room_ids
    change_column :bookings, :chapel_ids, :string 
    change_column :bookings, :room_ids, :string
  end

  def self.down
  end
end
