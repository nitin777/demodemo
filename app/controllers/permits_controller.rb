class PermitsController < ApplicationController
  before_action :set_grave, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /permits
  # GET /permits.json
  def index
    @o_all = get_records(params[:permit], params[:page])
    @search_fields = ['interred_name']
    session[:permit] = params[:permit] if params[:permit]
  end

  def show_grave_search
    @o_single = Permit.new
  end

  # GET /permits/1
  # GET /permits/1.json
  def show
  end

  # GET /permits/new
  def new
    @o_single = Permit.new
  end

  # GET /permits/1/edit
  def edit
  end

  # POST /permits
  # POST /permits.json
  def create
    @o_single = Permit.new(grave_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to permits_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permits/1
  # PATCH/PUT /permits/1.json
  def update
    respond_to do |format|
      if @o_single.update(grave_params)
        format.html { redirect_to permits_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
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
    def set_grave
      @o_single = Permit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grave_params
      params.require(:permit).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      grave_query = @cemetery.permits.search(search)
      grave_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @permits = true
    end
    
    #column sort
    def sort_column
      Permit.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
