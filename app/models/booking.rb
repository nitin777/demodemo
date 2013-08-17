class Booking < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :user
  belongs_to :grafe
  belongs_to :grantee
  belongs_to :service_type
  belongs_to :disease
  belongs_to :monument
  belongs_to :coffin
  belongs_to :unit_type
  belongs_to :chapel
  belongs_to :room
  belongs_to :catalog
  belongs_to :payment_status
  belongs_to :funeral_director, class_name: 'User', foreign_key: "funeral_director_id"  
  has_one :booking_checklist, :dependent => :destroy
  accepts_nested_attributes_for :booking_checklist
  
  include SearchHandler
  
  validates :deceased_surname, :presence => true
  validates :deceased_first_name, :presence => true
  
  scope :finalized, -> {where(:is_finalized => true)}
  
  
    
end
