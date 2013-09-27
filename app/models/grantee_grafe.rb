class GranteeGrafe < ActiveRecord::Base
  belongs_to :user
  belongs_to :grantee
  belongs_to :area
  belongs_to :section
  belongs_to :row
  belongs_to :plot  
  belongs_to :grafe
  belongs_to :identity  
  belongs_to :catalog
  belongs_to :payment_status
  has_many :payments, :as => :paymentable, :dependent => :destroy
  include SearchHandler
  
  validates :grantee_id, :presence => true  
  validates :grafe_id, :presence => true
end
