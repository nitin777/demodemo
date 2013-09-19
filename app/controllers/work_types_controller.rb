class WorkTypesController < ApplicationController
  before_action :set_work_type, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /work_types
  # GET /work_types.json
  def index
    @o_all = get_records(params[:work_type], params[:page])
    @search_fields = ['name']
    session[:work_type] = params[:work_type] if params[:work_type]
  end

  def show_work_type_search
    @o_single = WorkType.new
  end

  # GET /work_types/1
  # GET /work_types/1.json
  def show
  end

  # GET /work_types/new
  def new
    @o_single = WorkType.new
  end

  # GET /work_types/1/edit
  def edit
  end

  # POST /work_types
  # POST /work_types.json
  def create
    @o_single = WorkType.new(work_type_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to work_types_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_types/1
  # PATCH/PUT /work_types/1.json
  def update
    respond_to do |format|
      if @o_single.update(work_type_params)
        format.html { redirect_to work_types_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_types/1
  # DELETE /work_types/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to work_types_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_work_type
      @o_single = WorkType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_type_params
      params.require(:work_type).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      work_type_query = @cemetery.work_types.search(search)
      work_type_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @maintenance_active = "active"
    end
    
    #column sort
    def sort_column
      WorkType.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
