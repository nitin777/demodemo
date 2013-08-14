class Area < ActiveRecord::Base
  belongs_to :cemetery
  
  has_many :sections, :dependent => :destroy
  has_many :rows, :dependent => :destroy
  has_many :plots, :dependent => :destroy
  has_many :graves, :dependent => :destroy  
  validates :name, :presence => true
  include SearchHandler  
end
