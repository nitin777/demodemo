class Folder < ActiveRecord::Base
  belongs_to :user
  belongs_to :cemetery
  has_many :folders, class_name: "Folder", foreign_key: :folder_id, :dependent => :destroy
  belongs_to :parent_folder, class_name: "Folder", foreign_key: :folder_id
  has_many :files, class_name: "Folder", conditions: {is_folder: false}, :dependent => :destroy
  has_many :document_shares, :dependent => :destroy
  validates :name, :presence => true  
  
  scope :parent_folders, -> {where("folder_id IS NULL")}
  
  scope :interment_documents, lambda { |interment_id| where("document_type = ? and document_type_id = ? and folder_id IS NULL", "Interment", interment_id) }
  
  scope :permit_documents, lambda { |permit_id| where("document_type = ? and document_type_id = ? and folder_id IS NULL", "Permit", permit_id) }
  
  scope :work_order_documents, lambda { |work_order_id| where("document_type = ? and document_type_id = ? and folder_id IS NULL", "Work Order", work_order_id) }
  
  scope :grantees_documents, lambda { |grantee_id| where("document_type = ? and document_type_id = ? and folder_id IS NULL", "Grantee", grantee_id) }
  
  
  
  mount_uploader :file_path, ImageUploader  
end
