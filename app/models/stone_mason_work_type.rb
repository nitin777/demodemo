class StoneMasonWorkType < ActiveRecord::Base
  validates :name, :presence => true
  include SearchHandler
  scope :active, -> {where(:is_active => true)}  
end
