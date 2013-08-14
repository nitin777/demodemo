class Chapel < ActiveRecord::Base
  belongs_to :cemetery
  validates :name, :presence => true
  include SearchHandler
  scope :active, -> {where(:is_active => true)}  
end
