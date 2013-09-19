class ChangeReceivedDateToPermits < ActiveRecord::Migration
  def change
    change_column :permits, :received_date, :date
  end
end
