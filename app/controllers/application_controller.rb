class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin?, :is_manager?, :is_staff?, :is_funeral_director?, :is_admin_staff?, :is_stone_mason?, :is_normal_staff?, :user_access?, :cemetery_access?, :booking_access?, :maintenance_access?
  before_action :set_cemetery_record
  
	SUPER_ADMIN = "SuperAdmin"
	MANAGER = "Manager"
	STAFF = "Staff"
	ADMIN_STAFF = "AdminStaff"
	FUNERAL_DIRECTOR = "FuneralDirector"
	STONE_MASON = "StoneMason"
	NORMAL_STAFF = "NormalStaff"

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
		@current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      redirect_to :controller => "user_sessions", :action => "new"
    end
  end
  
  def require_admin
    unless session[:user_role] == SUPER_ADMIN
      redirect_to :controller => "user_sessions", :action => "new"
    end
  end  
 
  def authenticate_email(email)
    user_exists = User.exists?(email: email)
    if user_exists
			user = User.find_by_email(email)
			return user
	  end
	  return false
  end
  
  def authenticate_change_password(password)
      user_exists = User.exists?(password: password)
      if user_exists
		user = User.find_by_password(password)
		return user
	  end
	  return false
  end

	def is_admin?
		session[:user_role] == SUPER_ADMIN
	end
	
  def is_manager?
	 session[:user_role] == MANAGER
  end
  
  def is_staff?
   session[:user_role] == STAFF
  end  

  def is_admin_staff?
   session[:user_role] == ADMIN_STAFF
  end  
  
  def is_funeral_director?
   session[:user_role] == FUNERAL_DIRECTOR
  end  

  def is_stone_mason?
   session[:user_role] == STONE_MASON
  end
  
  def is_normal_staff?
   session[:user_role] == NORMAL_STAFF
  end  
  
  def user_access?
    (@role and role_permission_user_access?) ? true : false
  end
  
  def role_permission_user_access?
    role_permission = @cemetery.role_permissions.where(:role_id => @role.id).first
    (role_permission and role_permission.user_access) ? true : false 
  end
  
  def cemetery_access?
    (@role and role_permission_cemetery_access?) ? true : false
  end
  
  def role_permission_cemetery_access?
    role_permission = @cemetery.role_permissions.where(:role_id => @role.id).first
    (role_permission and role_permission.cemetery_access) ? true : false 
  end  
  
  def booking_access?
    (@role and role_permission_booking_access?) ? true : false
  end
  
  def role_permission_booking_access?
    role_permission = @cemetery.role_permissions.where(:role_id => @role.id).first
    (role_permission and role_permission.booking_access) ? true : false 
  end
  
  def maintenance_access?
    (@role and role_permission_maintenance_access?) ? true : false
  end
  
  def role_permission_maintenance_access?
    role_permission = @cemetery.role_permissions.where(:role_id => @role.id).first
    (role_permission and role_permission.maintenance_access) ? true : false 
  end
  
  def get_host_name(email)
  	unless email.nil?
  		email_arr = []
  		email_arr = email.split("@")
  		if email_arr[1]
  			email_arr = email_arr[1].split(".")
  			email_arr[0]
  		end
  	end
  end
  
  def set_cemetery_record
    @cemetery = session[:cemetery_id].nil? ? nil : (Cemetery.find(session[:cemetery_id]))
    @role = session[:role_id].nil? ? nil : (Role.find(session[:role_id]))
  end
  
end