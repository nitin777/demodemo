class AddWorkOrderNumberToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :work_order_number, :string, :after => :is_completed
    add_column :work_orders, :requested_date, :date, :after => :is_completed
    add_column :work_orders, :requested_user_id, :integer, :after => :is_completed
    add_column :work_orders, :approved_date, :date, :after => :is_completed
    add_column :work_orders, :approved_user_id, :integer, :after => :is_completed
    add_column :work_orders, :approved, :boolean, :default => true, :after => :is_completed
    add_column :work_orders, :operation_notes, :text, :after => :is_completed
    add_column :work_orders, :customer_requested_callback, :boolean, :default => false, :after => :is_completed
    add_column :work_orders, :unique_id, :string, :after => :is_completed
    add_column :work_orders, :notified_customer, :boolean, :default => false, :after => :is_completed
    add_column :work_orders, :notified_by, :integer, :after => :is_completed
    add_column :work_orders, :work_order_notes, :text, :after => :is_completed
    add_column :work_orders, :cancelled, :boolean, :default => false, :after => :is_completed
    
   
    add_column :maintenances, :maintenance_company_id, :integer, :after => :notes
  end
end
