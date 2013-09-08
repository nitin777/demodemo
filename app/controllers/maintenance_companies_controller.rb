class MaintenanceCompaniesController < ApplicationController
  before_action :set_grave, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /maintenance_companies
  # GET /maintenance_companies.json
  def index
    @o_all = get_records(params[:maintenance_company], params[:page])
    @search_fields = ['name, email']
    session[:maintenance_company] = params[:maintenance_company] if params[:maintenance_company]
  end

  def show_grave_search
    @o_single = MaintenanceCompany.new
  end

  # GET /maintenance_companies/1
  # GET /maintenance_companies/1.json
  def show
  end

  # GET /maintenance_companies/new
  def new
    @o_single = MaintenanceCompany.new
  end

  # GET /maintenance_companies/1/edit
  def edit
  end

  # POST /maintenance_companies
  # POST /maintenance_companies.json
  def create
    @o_single = MaintenanceCompany.new(grave_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to maintenance_companies_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_companies/1
  # PATCH/PUT /maintenance_companies/1.json
  def update
    respond_to do |format|
      if @o_single.update(grave_params)
        format.html { redirect_to maintenance_companies_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_companies/1
  # DELETE /maintenance_companies/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to maintenance_companies_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_grave
      @o_single = MaintenanceCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grave_params
      params.require(:maintenance_company).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      grave_query = @cemetery.maintenance_companies.search(search)
      grave_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @maintenance_active = "active"
    end
    
    #column sort
    def sort_column
      MaintenanceCompany.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
