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
  has_many :monuments, :dependent => :destroy
  has_many :catalogs, :dependent => :destroy  
  has_many :bookings, :dependent => :destroy  
  
  has_many :users, :dependent => :destroy
  
  validates :name, :presence => true
  validates :country_id, :presence => true
  
  mount_uploader :map, ImageUploader
  
  include SearchHandler
  
  scope :active, -> {where(:is_active => true)}  
end
