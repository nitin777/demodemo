class User < ActiveRecord::Base

  include SearchHandler	
	include ActionView::Helpers::TextHelper
	
  acts_as_authentic do |c|
    c.validate_email_field = false
    c.login_field = 'username'
  end
  
  attr_writer :password_required

  validates_presence_of :password, :if => :password_required?

  def password_required?
    @password_required
  end    
  
	validates_uniqueness_of :username
	validates :email, :presence => true
	validates :country_id, :presence => true
	validates :cemetery_id, :presence => true
	has_one :user_role, :dependent => :destroy
	has_one :role, :through => :user_role
	
	belongs_to :cemetery
	
	belongs_to :country
	
	has_many :grantee_graves
	has_many :bookings
	
	scope :all_stone_masons, joins(:role).where(:roles => { :role_type => "StoneMason" })
	
	scope :active, -> {where(:is_active => true)}
	
	mount_uploader :image, ImageUploader

	def user_name
		return self.first_name.blank? ? self.username : (self.first_name.to_s + " " + self.last_name.to_s)
	end
	
  def has_role?(role)
    self.user_role.role.role_type == role
  end
  
  def is_super_admin?
    has_role?("SuperAdmin")
  end
  
  def is_user?
    has_role?("User")
  end
  
  def is_provider_user?
    self.authorizations
  end  
  
  def has_cv?
  	self.cv	
  end
  
  def is_not_invited_user(invited_user_id)
  	self.id != invited_user_id
  end
  
  def name(shorten=true)
    unless first_name.nil? && last_name.nil? or first_name.empty? && last_name.empty?
      [first_name, last_name].join(" ")
    else
      shorten ? truncate(email, :omission => "..", :length => 20) : email
    end
  end  

  def user_name(shorten=true)
    unless first_name.nil? && last_name.nil? or first_name.empty? && last_name.empty?
      [first_name, last_name].join("-")
    else
      shorten ? truncate(email, :omission => "..", :length => 20) : email
    end
  end
  	
end
