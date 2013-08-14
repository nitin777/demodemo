class Role < ActiveRecord::Base

  has_many   :users     
  
  validates_presence_of :role_type
  validates_uniqueness_of :role_type
  
  scope :active, -> {where(:is_active => true)}
end