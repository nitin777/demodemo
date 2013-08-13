class GraveStatusesController < ApplicationController
  before_action :set_grave_status, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_admin
  before_action :set_header_menu_active
  # GET /grave_statuses
  # GET /grave_statuses.json
  def index
    @o_all = get_records(params[:grave_status], params[:page])
    session[:grave_status] = params[:grave_status] if params[:grave_status]
  end

  def show_grave_status_search
    @o_single = GraveStatus.new
  end

  # GET /grave_statuses/1
  # GET /grave_statuses/1.json
  def show
  end

  # GET /grave_statuses/new
  def new
    @o_single = GraveStatus.new
  end

  # GET /grave_statuses/1/edit
  def edit
  end

  # POST /grave_statuses
  # POST /grave_statuses.json
  def create
    @o_single = GraveStatus.new(grave_status_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to grave_statuses_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grave_statuses/1
  # PATCH/PUT /grave_statuses/1.json
  def update
    respond_to do |format|
      if @o_single.update(grave_status_params)
        format.html { redirect_to grave_statuses_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grave_statuses/1
  # DELETE /grave_statuses/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to grave_statuses_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_grave_status
      @o_single = GraveStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grave_status_params
      params.require(:grave_status).permit(:name, :is_active)
    end
    
    #fetch search records
    def get_records(search, page)
      grave_status_query = GraveStatus.search(search)
      grave_status_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @grave_statuses = true
    end
    
    #column sort
    def sort_column
      GraveStatus.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
