class UnitType < ActiveRecord::Base
  validates :name, :presence => true
  include SearchHandler  
end
