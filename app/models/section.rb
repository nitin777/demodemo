class Section < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :area
  
  has_many :rows, :dependent => :destroy
  has_many :plots, :dependent => :destroy
  has_many :graves, :dependent => :destroy    
  validates :name, :presence => true
  include SearchHandler  
end
