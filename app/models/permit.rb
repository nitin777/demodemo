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
  has_many :permit_charges
  include SearchHandler
  validates :permit_number, :presence => true
  scope :active, -> {where(:is_active => true)}  
end
