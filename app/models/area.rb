class Area < ActiveRecord::Base
  belongs_to :cemetery
  
  has_many :sections, :dependent => :destroy
  has_many :rows, :dependent => :destroy
  has_many :plots, :dependent => :destroy
  has_many :graves, :dependent => :destroy
  has_many :bookings, :dependent => :destroy
  has_many :grantee_graves, :dependent => :destroy
  has_many :maintenances, :dependent => :destroy
  has_many :permits, :dependent => :destroy    
  validates :code, :presence => true
  validates :name, :presence => true
  validates :cemetery_id, :presence => true
  
  include SearchHandler 
  
  mount_uploader :map, ImageUploader
   
  scope :active, -> {where(:is_active => true)}
end
