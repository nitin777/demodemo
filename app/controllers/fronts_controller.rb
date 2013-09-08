class FrontsController < ApplicationController
	require 'builder'
  before_filter :require_user, :only => [:change_password]
  before_filter :set_header_menu_active
  
  #dashboard
  
  def index
    render :layout => "cemetery"
  end
  
  def dashboard
    @o_booking = Booking.new
    @today_date = (params[:booking] and params[:booking][:service_date]) ? params[:booking][:service_date] : Date.today
    @service_types = ServiceType.all
    #@chapels = Booking.chapels.where(:service_date => @today_date)
    #@rooms = Booking.rooms.where(:service_date => @today_date)
    @chapels = ""
    @rooms = ""
  	if current_user
      @user = User.find(current_user.id)
  	end	
  end
  
  def show_search_box
    @o_single = params[:model].constantize.new
    @params_arr = params[:pm].split(',')
  end
  
  def grave_search_box
    @o_single = params[:model].constantize.new
    @params_arr = params[:pm].split(',')
  end
  
  def booking_search_box
    @o_single = params[:model].constantize.new
    @params_arr = params[:pm].split(',')
  end      
  
  def get_section_from_area
    unless params[:row][:area_id].blank?
      @sections = Section.where(:area_id => params[:row][:area_id])
    else
      @sections = @cemetery.sections.in_cemetery.active
    end
  end 
  
  def get_section_row_from_area
    unless params[:plot][:area_id].blank?
      @sections = Section.where(:area_id => params[:plot][:area_id])
      @rows = Row.where(:area_id => params[:plot][:area_id])
    else
      @sections = @cemetery.sections.active
      @rows = @cemetery.rows.in_cemetery.active
    end    
  end 
  
  def get_row_from_section
    unless params[:plot][:section_id].blank?
      @rows = Row.where(:section_id => params[:plot][:section_id])
    else
      @rows = @cemetery.rows.in_cemetery.active
    end   
  end
  
  def get_section_row_plot_from_area
    unless params[:grafe][:area_id].blank?
      @sections = Section.where(:area_id => params[:grafe][:area_id])
      @rows = Row.where(:area_id => params[:grafe][:area_id])
      @plots = Plot.where(:area_id => params[:grafe][:area_id])
    else
      @sections = @cemetery.sections.in_cemetery.active
      @rows = @cemetery.rows.in_cemetery.active
      @plots = @cemetery.plots.in_cemetery.active
    end    
  end
  
  def get_row_plot_from_section
    unless params[:grafe][:section_id].blank?
      @rows = Row.where(:section_id => params[:grafe][:section_id])
      @plots = Plot.where(:section_id => params[:grafe][:section_id])
    else
      @rows = @cemetery.rows.in_cemetery.active
      @plots = @cemetery.plots.in_cemetery.active
    end    
  end
  
  def get_plot_from_row
    unless params[:grafe][:row_id].blank?
      @plots = Plot.where(:row_id => params[:grafe][:row_id])
    else
      @plots = @cemetery.plots.in_cemetery.active
    end    
  end
  
  def get_cemetery_from_country
    unless params[:user][:country_id].blank?
      @cemeteries = Cemetery.where(:country_id => params[:user][:country_id])
    else
      @cemeteries = nil
    end     
  end
  
  def get_section_row_plot_grave_from_area
    area_id = ''
    if params[:booking] and params[:booking][:area_id] != '' 
      area_id = params[:booking][:area_id]
    elsif params[:grantee_grafe] and params[:grantee_grafe][:area_id] != ''
      area_id = params[:grantee_grafe][:area_id]      
    elsif params[:maintenance] and params[:maintenance][:area_id] != ''
      area_id = params[:maintenance][:area_id]
    elsif params[:permit] and params[:permit][:area_id] != ''
      area_id = params[:permit][:area_id]      
    end
    
    unless area_id.blank?
      area = Area.find(area_id)
      @sections = area.sections.active
      @rows = area.rows.active
      @plots = area.plots.active
      @graves = area.graves.active            
    else
      @sections = @cemetery.sections.in_cemetery.active
      @rows = @cemetery.rows.in_cemetery.active
      @plots = @cemetery.plots.in_cemetery.active
      @graves = @cemetery.graves.in_cemetery.active
    end   
  end
  
  def get_row_plot_grave_from_section
    section_id = ''
    if params[:booking] and params[:booking][:section_id] != ''
      section_id = params[:booking][:section_id]
    elsif params[:grantee_grafe] and params[:grantee_grafe][:section_id] != ''
      section_id = params[:grantee_grafe][:section_id]
    elsif params[:maintenance] and params[:maintenance][:section_id] != ''
      section_id = params[:maintenance][:section_id]
    elsif params[:permit] and params[:permit][:section_id] != ''
      section_id = params[:permit][:section_id]      
    end
    
    unless section_id.blank?
      section = Section.find(section_id)
      @rows = section.rows.active
      @plots = section.plots.active
      @graves = section.graves.active              
    else
      @rows = @cemetery.rows.in_cemetery.active
      @plots = @cemetery.plots.in_cemetery.active
      @graves = @cemetery.graves.in_cemetery.active
    end     
  end
  
  def get_plot_grave_from_row
    row_id = ''
    if params[:booking] and params[:booking][:row_id] != ''
      row_id = params[:booking][:row_id]
    elsif params[:grantee_grafe] and params[:grantee_grafe][:row_id] != ''
      row_id = params[:grantee_grafe][:row_id]
    elsif params[:maintenance] and params[:maintenance][:row_id] != ''
      row_id = params[:maintenance][:row_id]
    elsif params[:permit] and params[:permit][:row_id] != ''
      row_id = params[:permit][:row_id]      
    end
    
    unless row_id.blank?
      row = Row.find(row_id)
      @plots = row.plots.active
      @graves = row.graves.active   
    else
      @plots = @cemetery.plots.in_cemetery.active
      @graves = @cemetery.graves.in_cemetery.active
    end
  end
  
  def get_grave_from_plot
    plot_id = ''
    if params[:booking] and params[:booking][:plot_id] != ''
      plot_id =  params[:booking][:plot_id]
    elsif params[:grantee_grafe] and params[:grantee_grafe][:plot_id] != ''
      plot_id =  params[:grantee_grafe][:plot_id]
    elsif params[:maintenance] and params[:maintenance][:plot_id] != ''
      plot_id =  params[:maintenance][:plot_id]
    elsif params[:permit] and params[:permit][:plot_id] != ''
      plot_id =  params[:permit][:plot_id]      
    end
    
    unless plot_id.blank?
      plot = Plot.find(plot_id)
      @graves = plot.graves.active        
    else
      @graves = @cemetery.graves.in_cemetery.active
    end       
  end
  
  def get_grantee_from_grave
    if params[:booking] and params[:booking][:grafe_id] != ''
      grave = Grafe.find(params[:booking][:grafe_id])
      @grantees = grave.grantees
    else
      @grantees = nil
    end
  end
  
  def get_booking_from_grave
    if params[:permit] and params[:permit][:grafe_id] != ''
      grave = Grafe.find(params[:permit][:grafe_id])
      @bookings = grave.bookings
    else
      @bookings = nil
    end
  end  

  def get_grantee_booking_from_grave
    if params[:permit] and params[:permit][:grafe_id] != ''
      grave = Grafe.find(params[:permit][:grafe_id])
      @bookings = grave.bookings
      @grantees = grave.grantees
    else
      @bookings = nil
      @grantees = nil
    end    
  end

  
  #forgot password
  def forgot_password
    @user = User.new
    if params[:user]
      if user = authenticate_email(params[:user][:email])
        new_pass = SecureRandom.hex(5)
        user.password = user.password_confirmation = new_pass
        user.save
        
        #options
        opts = { :username => user.name, :new_pass => new_pass }    
        
        #subject
        subject = t("general.reset_password")
        
        #send mail
        UserMailer.forgot_password_confirmation(user.email, subject, opts).deliver        
        
        @user_session = UserSession.find
        if @user_session
          @user_session.destroy
        end
        session[:user_id] = nil
        flash[:forgot_pass_success] = t("general.password_has_been_sent_to_your_email_address")
      else
        flash[:forgot_pass_error] = t("general.no_user_exists_for_provided_email_address")
      end
    end 
    render :layout => "cemetery"
  end

  #change password
  def change_password
    @o_single = User.find(current_user.id)
    if params[:user]
      @o_single.password = params[:user][:password]
      @o_single.password_confirmation = params[:user][:password_confirmation]
      @o_single.password_required = true
      respond_to do |format|
        if @o_single.update_attributes(user_params)
          format.html { redirect_to users_url, notice: t("general.password_successfully_updated") }
          format.json { head :no_content }
        else
          format.html { render action: 'change_password' }
          format.json { render json: @o_single.errors, status: :unprocessable_entity }
        end
      end
    end  
  end
  
  #profile
  def profile
    @o_single = User.find(current_user.id)
    if params[:user]    
      respond_to do |format|
        if @o_single.update_attributes(user_params)
          format.html { redirect_to profile_url, notice: t("general.successfully_updated") }
          format.json { head :no_content }
        else
          format.html { render action: 'profile' }
          format.json { render json: @o_single.errors, status: :unprocessable_entity }
        end
      end      
    end
  end
  
	#footer and other static pages
  def other
  	@o_single = StaticPage.where(page_route: params[:page_id]).first
  end
  

	private
 	
  def set_header_menu_active
    @dashboard_active = "active"
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
  
end
