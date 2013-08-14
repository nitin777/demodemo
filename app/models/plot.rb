class Plot < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :area
  belongs_to :section
  belongs_to :row
  
  has_many :graves, :dependent => :destroy  
  
  validates :name, :presence => true
  include SearchHandler  
end
