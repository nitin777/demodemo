class Section < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :area
  
  has_many :rows, :dependent => :destroy
  has_many :plots, :dependent => :destroy
  has_many :graves, :dependent => :destroy
  has_many :bookings, :dependent => :destroy
  has_many :maintenances, :dependent => :destroy
  has_many :permits, :dependent => :destroy      
  has_many :grantee_graves, :dependent => :destroy      
  validates :name, :presence => true
  validates :code, :presence => true
  
  include SearchHandler
  
  mount_uploader :map, ImageUploader
  
  scope :active, -> {where(:is_active => true)}
  
  scope :in_cemetery, -> {where("area_id IS NULL")}
  
    
end
