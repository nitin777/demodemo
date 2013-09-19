class Catalog < ActiveRecord::Base
  has_many :grantee_graves
  has_many :bookings
  has_many :work_orders
  belongs_to :category
  validates :name, :presence => true
  include SearchHandler
  scope :active, -> {where(:is_active => true)}  
end
