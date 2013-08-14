class Booking < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :user
  belongs_to :grave
  belongs_to :grantee
  belongs_to :service_type
  has_one :booking_checklist, :dependent => :destroy
  include SearchHandler  
end
