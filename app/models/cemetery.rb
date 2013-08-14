class Cemetery < ActiveRecord::Base
  belongs_to :country
  has_many :areas, :dependent => :destroy
  has_many :sections, :dependent => :destroy
  has_many :rows, :dependent => :destroy
  has_many :plots, :dependent => :destroy
  has_many :graves, :dependent => :destroy
  has_many :grantees, :dependent => :destroy
  has_many :chapels, :dependent => :destroy
  has_many :rooms, :dependent => :destroy
  has_many :stone_masons, :dependent => :destroy
  validates :name, :presence => true
  include SearchHandler  
end
