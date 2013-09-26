class Permit < ActiveRecord::Base
  belongs_to :user
  belongs_to :cemetery
  belongs_to :area
  belongs_to :section
  belongs_to :row
  belongs_to :plot
  belongs_to :grafe
  belongs_to :booking  
  belongs_to :grantee
  belongs_to :catalog
  belongs_to :stonemason, class_name: "User", foreign_key: :stonemason_id
  has_many :permit_charges
  
  has_many :payments, :as => :paymentable, :dependent => :destroy
  
  include SearchHandler
  validates :permit_number, :presence => true
  scope :active, -> {where(:is_active => true)}  
end
