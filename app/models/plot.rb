class Plot < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :area
  belongs_to :section
  belongs_to :row
  
  has_many :graves, :dependent => :destroy
  has_many :bookings, :dependent => :destroy  
  
  validates :name, :presence => true
  
  include SearchHandler
  
  mount_uploader :map, ImageUploader
  
  scope :active, -> {where(:is_active => true)}
  
  scope :in_cemetery, -> {where("area_id IS NULL and section_id IS NULL and row_id IS NULL")}  
end
