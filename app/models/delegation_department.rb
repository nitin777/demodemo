class DelegationDepartment < ActiveRecord::Base
  belongs_to :cemetery
  validates :name, :presence => true
  has_many :work_orders
  scope :active, -> {where(:is_active => true)}
  include SearchHandler
end
