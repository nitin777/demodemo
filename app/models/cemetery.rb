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
  has_many :letters, :dependent => :destroy
  has_many :facilities, :dependent => :destroy
  has_many :maintenances, :dependent => :destroy
  has_many :permits, :dependent => :destroy
  has_many :maintenance_companies, :dependent => :destroy  
  has_many :users, :dependent => :destroy
  has_many :role_permissions, :dependent => :destroy
  
  has_many :work_orders, :dependent => :destroy
  has_many :work_types, :dependent => :destroy
  has_many :delegation_departments, :dependent => :destroy
  has_many :categories, :dependent => :destroy
  
  has_many :folders, :dependent => :destroy
  
  has_many :interment_documents, class_name: 'Folder', conditions: {document_type: "Interment"}
  has_many :permit_documents, class_name: 'Folder', conditions: {document_type: "Permit"}
  has_many :work_order_documents, class_name: 'Folder', conditions: {document_type: "Work Order"}
  has_many :personal_documents, class_name: 'Folder', conditions: {document_type: "Personal"}
  
  validates :name, :presence => true
  validates :country_id, :presence => true
  
  mount_uploader :map, ImageUploader
  
  include SearchHandler
  
  scope :active, -> {where(:is_active => true)}  
end
