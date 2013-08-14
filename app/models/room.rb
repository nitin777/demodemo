class Room < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :cemetery
  include SearchHandler  
end
