class MaintenanceCompany < ActiveRecord::Base
  include SearchHandler
  validates :name, :presence => true
  validates :email, :presence => true
  scope :active, -> {where(:is_active => true)}
end
