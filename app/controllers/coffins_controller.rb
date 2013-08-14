class CoffinsController < ApplicationController
  before_action :set_coffin, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_admin
  before_action :set_header_menu_active
  # GET /coffins
  # GET /coffins.json
  def index
    @o_all = get_records(params[:coffin], params[:page])
    @search_fields = ['name']
    session[:coffin] = params[:coffin] if params[:coffin]
  end

  def show_coffin_search
    @o_single = Coffin.new
  end

  # GET /coffins/1
  # GET /coffins/1.json
  def show
  end

  # GET /coffins/new
  def new
    @o_single = Coffin.new
  end

  # GET /coffins/1/edit
  def edit
  end

  # POST /coffins
  # POST /coffins.json
  def create
    @o_single = Coffin.new(coffin_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to coffins_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffins/1
  # PATCH/PUT /coffins/1.json
  def update
    respond_to do |format|
      if @o_single.update(coffin_params)
        format.html { redirect_to coffins_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffins/1
  # DELETE /coffins/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to coffins_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_coffin
      @o_single = Coffin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffin_params
      params.require(:coffin).permit(:name, :is_active)
    end
    
    #fetch search records
    def get_records(search, page)
      coffin_query = Coffin.search(search)
      coffin_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @coffins = true
    end
    
    #column sort
    def sort_column
      Coffin.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
