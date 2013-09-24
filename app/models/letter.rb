class Letter < ActiveRecord::Base
  belongs_to :cemetery
  validates :subject, :presence => true
  validates :content, :presence => true  
  include SearchHandler
  scope :active, -> {where(:is_active => true)}
  scope :all_certificates, -> {where(:is_certificate => true)}   
  scope :all_letters, -> {where(:is_certificate => false)}
  scope :all_booking_letters, -> {where(:is_certificate => false, :letter_type => "Interment")} 
  scope :all_maintenance_letters, -> {where(:is_certificate => false, :letter_type => "Maintenance")}
  
  scope :all_work_order_letters, -> {where(:is_certificate => false, :letter_type => "Work Order")}
  scope :all_permit_letters, -> {where(:is_certificate => false, :letter_type => "Permit")}
  
  
  scope :interment_certificate, -> {where(:is_certificate => true, :letter_type => "interment_certificate")}
  scope :burial_certificate, -> {where(:is_certificate => true, :letter_type => "burial_certificate")}
  scope :grave_transfer_certificate, -> {where(:is_certificate => true, :letter_type => "grave_transfer_certificate")}
end
