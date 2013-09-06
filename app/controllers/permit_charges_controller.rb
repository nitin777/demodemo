class PermitChargesController < ApplicationController
  before_action :set_permit_charge, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /permit_charges
  # GET /permit_charges.json
  def index
    @o_all = get_records(params[:permit_charge], params[:page])
    @search_fields = ['name']
    session[:permit_charge] = params[:permit_charge] if params[:permit_charge]
  end

  def show_permit_charge_search
    @o_single = PermitCharge.new
  end

  # GET /permit_charges/1
  # GET /permit_charges/1.json
  def show
  end

  # GET /permit_charges/new
  def new
    @o_single = PermitCharge.new
  end

  # GET /permit_charges/1/edit
  def edit
  end

  # POST /permit_charges
  # POST /permit_charges.json
  def create
    @o_single = PermitCharge.new(permit_charge_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to permit_charges_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permit_charges/1
  # PATCH/PUT /permit_charges/1.json
  def update
    respond_to do |format|
      if @o_single.update(permit_charge_params)
        format.html { redirect_to permit_charges_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permit_charges/1
  # DELETE /permit_charges/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to permit_charges_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_permit_charge
      @o_single = PermitCharge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permit_charge_params
      params.require(:permit_charge).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      permit_charge_query = PermitCharge.search(search)
      permit_charge_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @permit_charges = true
    end
    
    #column sort
    def sort_column
      PermitCharge.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end       
end
