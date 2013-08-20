class ServiceType < ActiveRecord::Base
  validates :name, :presence => true
  has_many :bookings
  include SearchHandler
  scope :active, -> {where(:is_active => true)}  
end
