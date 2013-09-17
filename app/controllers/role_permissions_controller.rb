class RolePermissionsController < ApplicationController
  before_action :set_role_permission, only: [:set_permission]
  before_action :require_user
  before_action :set_header_menu_active
  
  # GET /role_permissions
  # GET /role_permissions.json
  def index
    @o_all = @cemetery.role_permissions.includes(:role)
  end

  def set_permission
    case params[:access]
    when "user"
      access = @o_single.user_access ? false : true
      @o_single.user_access = access
      @o_single.save  
    when "cemetery"
      access = @o_single.cemetery_access ? false : true
      @o_single.cemetery_access = access
      @o_single.save
    when 'booking'
      access = @o_single.booking_access ? false : true
      @o_single.booking_access = access
      @o_single.save
    when 'maintenance'
      access = @o_single.maintenance_access ? false : true
      @o_single.maintenance_access = access
      @o_single.save
    else  
    end
    @o_all = @cemetery.role_permissions.includes(:role)
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_role_permission
    @o_single = RolePermission.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def role_permission_params
    params.require(:role_permission).permit!
  end
 
  #set header menu active
  def set_header_menu_active
    @users = "active"
  end
 
end
