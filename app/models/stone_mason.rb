class StoneMason < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :stone_mason_work_type
  validates :bond, :presence => true
  include SearchHandler  
  scope :active, -> {where(:is_active => true)}
end
