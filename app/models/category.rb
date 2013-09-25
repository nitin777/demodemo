class Category < ActiveRecord::Base
  belongs_to :cemetery
  
  has_many :categories, class_name: "Category", foreign_key: :parent_category_id, :dependent => :destroy
  belongs_to :parent_category, class_name: "Category", foreign_key: :parent_category_id
  
  has_many :catalogs
  
  scope :parent_categories, -> {where("parent_category_id IS NULL")}
  
  scope :active, -> {where(:is_active => true)}
  
  validates :name, :presence => true
  include SearchHandler  
end
