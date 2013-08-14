class Row < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :area
  belongs_to :section
  
  has_many :plots, :dependent => :destroy
  has_many :graves, :dependent => :destroy  
    
  validates :name, :presence => true
  
  include SearchHandler
  
  mount_uploader :map, ImageUploader
  
  scope :active, -> {where(:is_active => true)}  
end
