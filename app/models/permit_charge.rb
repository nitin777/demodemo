class PermitCharge < ActiveRecord::Base
  belongs_to :permit
  belongs_to :charge
  include SearchHandler
  validates :quantity, :presence => true    
end
