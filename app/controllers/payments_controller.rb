class PaymentsController < ApplicationController
  before_action :set_payment, only: [:destroy]
  before_action :require_user
  before_action :set_header_menu_active
  # GET /permits
  # GET /permits.json
  def index
    session[:amount] = nil
    @paymetable = find_paymetable 
    @payments = @paymetable.payments
    @payment_total = @payments.sum("total_amount") 
    set_redirect_url_and_header
  end
  
  def set_redirect_url_and_header
    if @paymetable.class.name == "Permit"
      @r_url = permits_url
      @header_name = @paymetable.permit_number
    elsif @paymetable.class.name == "WorkOrder"  
      @r_url = work_orders_url
      @header_name = @paymetable.name      
    elsif @paymetable.class.name == "Maintenance"  
      @r_url = maintenances_url
      @header_name = @paymetable.name
    elsif @paymetable.class.name == "Booking"  
      @r_url = bookings_url
      @header_name = @paymetable.deceased_name
    elsif @paymetable.class.name == "GranteeGrafe"  
      @r_url = grantee_graves_url
      @header_name = @paymetable.grantee.name if @paymetable.grantee            
    end                      
  end  

  # POST /permits
  # POST /permits.json
  def create
    @paymetable = find_paymetable
    @payment = @paymetable.payments.build(payment_params)
    if @payment.save
      flash[:notice] = t("general.successfully_created")
      session[:amount] = nil
      @payments = @paymetable.payments
      @payment_total = @payments.sum("total_amount")
      return      
      #redirect_to :id => nil
    end
  end
  
  def get_catalogs_from_category
    unless params[:category].blank?
      category = Category.find(params[:category])
      @catalogs = category.catalogs
    else
      @catalogs = nil  
    end  
  end
  
  def get_cost_price_from_catalog
    unless params[:payment][:catalog_id].blank?
      @catalog = Catalog.find(params[:payment][:catalog_id])
    else
      @catalog = nil
    end     
  end
  
  def get_amount_from_price
    @amount = params[:price].blank? ? 0 : params[:price] 
    session[:amount] = @amount.to_i 
  end
  
  def get_total_amount_from_quantity
    @total_amount = 0 
    unless session[:amount].nil?
      @total_amount = params[:payment][:quantity].to_i * session[:amount].to_i
    end    
  end
  

  # DELETE /permits/1
  # DELETE /permits/1.json
  def destroy
    @paymetable = find_paymetable
    @payment = Payment.find(params[:id])
    @payment.destroy
    
    @payments = @paymetable.payments
    @payment_total = @payments.sum("total_amount")
        
    flash[:notice] = t("general.successfully_destroyed")
    return
    #redirect_to set_redirect_url
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @o_single = Payment.find(params[:id])
    end
        
    #set header menu active
    def set_header_menu_active
      @maintenance_active = "active"
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit!
    end    
    
    def find_paymetable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end    
 
end
