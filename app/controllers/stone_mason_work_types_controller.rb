class StoneMasonWorkTypesController < ApplicationController
  before_action :set_stone_mason_work_type, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_admin
  before_action :set_header_menu_active
  # GET /stone_mason_work_types
  # GET /stone_mason_work_types.json
  def index
    @o_all = get_records(params[:stone_mason_work_type], params[:page])
    session[:stone_mason_work_type] = params[:stone_mason_work_type] if params[:stone_mason_work_type]
  end

  def show_stone_mason_work_type_search
    @o_single = StoneMasonWorkType.new
  end

  # GET /stone_mason_work_types/1
  # GET /stone_mason_work_types/1.json
  def show
  end

  # GET /stone_mason_work_types/new
  def new
    @o_single = StoneMasonWorkType.new
  end

  # GET /stone_mason_work_types/1/edit
  def edit
  end

  # POST /stone_mason_work_types
  # POST /stone_mason_work_types.json
  def create
    @o_single = StoneMasonWorkType.new(stone_mason_work_type_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to stone_mason_work_types_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stone_mason_work_types/1
  # PATCH/PUT /stone_mason_work_types/1.json
  def update
    respond_to do |format|
      if @o_single.update(stone_mason_work_type_params)
        format.html { redirect_to stone_mason_work_types_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stone_mason_work_types/1
  # DELETE /stone_mason_work_types/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to stone_mason_work_types_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_stone_mason_work_type
      @o_single = StoneMasonWorkType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stone_mason_work_type_params
      params.require(:stone_mason_work_type).permit(:name, :is_active)
    end
    
    #fetch search records
    def get_records(search, page)
      stone_mason_work_type_query = StoneMasonWorkType.search(search)
      stone_mason_work_type_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @stone_mason_work_types = true
    end
    
    #column sort
    def sort_column
      StoneMasonWorkType.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
