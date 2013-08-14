class StoneMasonWorkType < ActiveRecord::Base
  has_many :stone_masons, :dependent => :destroy
  validates :name, :presence => true
  include SearchHandler  
end
