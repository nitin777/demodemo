class Grave < ActiveRecord::Base
  validates :grave_number, :presence => true
  include SearchHandler  
end
