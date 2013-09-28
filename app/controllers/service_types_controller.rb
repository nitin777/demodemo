class ServiceTypesController < ApplicationController
  before_action :set_service_type, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_admin
  before_action :set_header_menu_active
  # GET /service_types
  # GET /service_types.json
  def index
    @o_all = get_records(params[:service_type], params[:page])
    @params_arr = ['name']
    @o_single = controller_name.classify.constantize.new
    session[:search_params] = params[:service_type] ? params[:service_type] : nil
  end

  def show_service_type_search
    @o_single = ServiceType.new
  end

  # GET /service_types/1
  # GET /service_types/1.json
  def show
  end

  # GET /service_types/new
  def new
    @o_single = ServiceType.new
  end

  # GET /service_types/1/edit
  def edit
  end

  # POST /service_types
  # POST /service_types.json
  def create
    @o_single = ServiceType.new(service_type_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to service_types_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_types/1
  # PATCH/PUT /service_types/1.json
  def update
    respond_to do |format|
      if @o_single.update(service_type_params)
        format.html { redirect_to service_types_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_types/1
  # DELETE /service_types/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to service_types_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_service_type
      @o_single = ServiceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_type_params
      params.require(:service_type).permit(:name, :is_active)
    end
    
    #fetch search records
    def get_records(search, page)
      service_type_query = ServiceType.search(search)
      service_type_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @admin_active = "active"
    end
    
    #column sort
    def sort_column
      ServiceType.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
