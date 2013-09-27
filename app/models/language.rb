class Language < ActiveRecord::Base
  validates :name, :code, :presence => true
  validates_uniqueness_of :name, :code
  scope :active, -> {where(:is_active => true)}
  scope :default, -> {where(:is_default => true)}
end
