class Country < ActiveRecord::Base
  validates :name, :presence => true
  include SearchHandler
  has_many :cemeteries
  scope :active, -> {where(:is_active => true)}
end
