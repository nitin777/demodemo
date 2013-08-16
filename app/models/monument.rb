class Monument < ActiveRecord::Base
  
  belongs_to :cemetery
  belongs_to :unit_type
  
  validates :name, :presence => true
  
  include SearchHandler
  
  scope :active, -> {where(:is_active => true)} 
  
end
