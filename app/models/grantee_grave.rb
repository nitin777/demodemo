class GranteeGrave < ActiveRecord::Base
  belongs_to :user
  belongs_to :grantee
  belongs_to :grave
  belongs_to :catalog
  belongs_to :payment_status
  include SearchHandler  
end
