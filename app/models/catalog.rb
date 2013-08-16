class Catalog < ActiveRecord::Base
  has_many :grantee_graves
  has_many :bookings
  validates :name, :presence => true
  include SearchHandler
  scope :active, -> {where(:is_active => true)}  
end
