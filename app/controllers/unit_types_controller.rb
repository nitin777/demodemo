class UnitTypesController < ApplicationController
  before_action :set_unit_type, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_admin
  before_action :set_header_menu_active
  # GET /unit_types
  # GET /unit_types.json
  def index
    @o_all = get_records(params[:unit_type], params[:page])
    @search_fields = ['name']
    session[:unit_type] = params[:unit_type] if params[:unit_type]
  end

  def show_unit_type_search
    @o_single = UnitType.new
  end

  # GET /unit_types/1
  # GET /unit_types/1.json
  def show
  end

  # GET /unit_types/new
  def new
    @o_single = UnitType.new
  end

  # GET /unit_types/1/edit
  def edit
  end

  # POST /unit_types
  # POST /unit_types.json
  def create
    @o_single = UnitType.new(unit_type_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to unit_types_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_types/1
  # PATCH/PUT /unit_types/1.json
  def update
    respond_to do |format|
      if @o_single.update(unit_type_params)
        format.html { redirect_to unit_types_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_types/1
  # DELETE /unit_types/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to unit_types_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_type
      @o_single = UnitType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_type_params
      params.require(:unit_type).permit(:name, :is_active)
    end
    
    #fetch search records
    def get_records(search, page)
      unit_type_query = UnitType.search(search)
      unit_type_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @unit_types = true
    end
    
    #column sort
    def sort_column
      UnitType.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
