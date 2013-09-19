class WorkType < ActiveRecord::Base
  belongs_to :cemetery
  validates :name, :presence => true
  scope :active, -> {where(:is_active => true)}
  include SearchHandler
end
