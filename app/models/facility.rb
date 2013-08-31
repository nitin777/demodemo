class Facility < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :user
  validates :surname, :presence => true
  validates :first_name, :presence => true
  scope :finalized, -> {where(:is_finalized => true)}
  
  include SearchHandler 
end
