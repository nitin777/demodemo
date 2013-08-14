class Grave < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :area
  belongs_to :section
  belongs_to :row
  belongs_to :plot
  belongs_to :grave_status
  belongs_to :stone_mason  
  belongs_to :unit_type
  has_many :grantee_graves, :dependent => :destroy
  validates :grave_number, :presence => true
  include SearchHandler  
end
