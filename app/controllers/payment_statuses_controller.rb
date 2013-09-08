class PaymentStatusesController < ApplicationController
  before_action :set_payment_status, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_admin
  before_action :set_header_menu_active
  # GET /payment_statuses
  # GET /payment_statuses.json
  def index
    @o_all = get_records(params[:payment_status], params[:page])
    @search_fields = ['name']
    session[:payment_status] = params[:payment_status] if params[:payment_status]
  end

  def show_payment_status_search
    @o_single = PaymentStatus.new
  end

  # GET /payment_statuses/1
  # GET /payment_statuses/1.json
  def show
  end

  # GET /payment_statuses/new
  def new
    @o_single = PaymentStatus.new
  end

  # GET /payment_statuses/1/edit
  def edit
  end

  # POST /payment_statuses
  # POST /payment_statuses.json
  def create
    @o_single = PaymentStatus.new(payment_status_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to payment_statuses_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_statuses/1
  # PATCH/PUT /payment_statuses/1.json
  def update
    respond_to do |format|
      if @o_single.update(payment_status_params)
        format.html { redirect_to payment_statuses_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_statuses/1
  # DELETE /payment_statuses/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to payment_statuses_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_status
      @o_single = PaymentStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_status_params
      params.require(:payment_status).permit(:name, :is_active)
    end
    
    #fetch search records
    def get_records(search, page)
      payment_status_query = PaymentStatus.search(search)
      payment_status_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @admin_active = "active"
    end
    
    #column sort
    def sort_column
      PaymentStatus.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
