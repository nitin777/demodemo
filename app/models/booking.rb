class Booking < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :user
  belongs_to :area
  belongs_to :section
  belongs_to :row
  belongs_to :plot
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
  
  scope :finalize, -> {where(:is_finalized => true)}
  scope :unfinalize, -> {where(:is_finalized => false)}
  
  def deceased_name(shorten=true)
    unless deceased_first_name.nil? && deceased_surname.nil? or deceased_first_name.empty? && deceased_surname.empty?
      [deceased_surname, deceased_first_name].join(" ")
    end
  end  
  
  scope :chapels, -> {where("chapel_id IS NOT NULL")}
  scope :rooms, -> {where("room_id IS NOT NULL")}
    
end
