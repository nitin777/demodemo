class Area < ActiveRecord::Base
  validates :area_name, :presence => true
  include SearchHandler  
end
