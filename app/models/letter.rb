class Letter < ActiveRecord::Base
  belongs_to :cemetery
  validates :subject, :presence => true
  validates :content, :presence => true  
  include SearchHandler
  scope :active, -> {where(:is_active => true)}
  scope :all_certificates, -> {where(:is_certificate => true)}   
  scope :all_letters, -> {where(:is_certificate => false)}
  scope :all_booking_letters, -> {where(:is_certificate => false, :letter_type => "Interment")} 
end
