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
  end

  # POST /permits
  # POST /permits.json
  def create
    @paymetable = find_paymetable
    @payment = @paymetable.payments.build(payment_params)
    if @payment.save
      flash[:notice] = "Successfully created comment."
      redirect_to :id => nil
    else
      render :action => 'new'
    end
  end
  
  def get_catalogs_from_category
    category = Category.find(params[:category])
    @catalogs = category.catalogs
  end
  
  def get_cost_price_from_catalog
    @catalog = Catalog.find(params[:payment][:catalog_id])
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
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to permits_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
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
