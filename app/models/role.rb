class Role < ActiveRecord::Base

  has_many   :users
  
  has_many :role_permissions     
  
  validates_presence_of :role_type
  validates_uniqueness_of :role_type
  
  scope :active, -> {where(:is_active => true)}
end