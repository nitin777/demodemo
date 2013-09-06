class Charge < ActiveRecord::Base
  has_many :permit_charges
  include SearchHandler
  validates :work_type, :presence => true
  scope :active, -> {where(:is_active => true)}  
end
