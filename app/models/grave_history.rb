class GraveHistory < ActiveRecord::Base
  belongs_to :identity
  belongs_to :catalog
  belongs_to :grantee
  belongs_to :grafe
  belongs_to :payment_status
  belongs_to :grantee_trasfer, class_name: 'Grantee'
  include SearchHandler
  
  validates :grantee_trasfer_id, :presence => true
end
