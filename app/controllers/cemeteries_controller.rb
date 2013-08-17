class CemeteriesController < ApplicationController
  before_action :set_cemetery, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /cemeteries
  # GET /cemeteries.json
  def index
    session[:cemetery_id] = nil
    @o_all = get_records(params[:cemetery], params[:page])
    @search_fields = ['name']
    session[:cemetery] = params[:cemetery] if params[:cemetery]
  end

  def show_cemetery_search
    @o_single = Cemetery.new
  end

  # GET /cemeteries/1
  # GET /cemeteries/1.json
  def show
    session[:cemetery_id] = params[:id] if params[:id]
    redirect_to areas_url
  end

  # GET /cemeteries/new
  def new
    @o_single = Cemetery.new
  end

  # GET /cemeteries/1/edit
  def edit
  end

  # POST /cemeteries
  # POST /cemeteries.json
  def create
    @o_single = Cemetery.new(cemetery_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to cemeteries_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cemeteries/1
  # PATCH/PUT /cemeteries/1.json
  def update
    respond_to do |format|
      if @o_single.update(cemetery_params)
        format.html { redirect_to cemeteries_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cemeteries/1
  # DELETE /cemeteries/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to cemeteries_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_cemetery
      @o_single = Cemetery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cemetery_params
      params.require(:cemetery).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      cemetery_query = Cemetery.search(search)
      cemetery_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @cemeteries = true
    end
    
    #column sort
    def sort_column
      Cemetery.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
