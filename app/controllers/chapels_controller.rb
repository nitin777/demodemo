class ChapelsController < ApplicationController
  before_action :set_chapel, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_admin
  before_action :set_header_menu_active
  # GET /chapels
  # GET /chapels.json
  def index
    @o_all = get_records(params[:chapel], params[:page])
    @search_fields = ['name']
    session[:chapel] = params[:chapel] if params[:chapel]
  end

  def show_chapel_search
    @o_single = Chapel.new
  end

  # GET /chapels/1
  # GET /chapels/1.json
  def show
  end

  # GET /chapels/new
  def new
    @o_single = Chapel.new
  end

  # GET /chapels/1/edit
  def edit
  end

  # POST /chapels
  # POST /chapels.json
  def create
    @o_single = Chapel.new(chapel_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to chapels_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapels/1
  # PATCH/PUT /chapels/1.json
  def update
    respond_to do |format|
      if @o_single.update(chapel_params)
        format.html { redirect_to chapels_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapels/1
  # DELETE /chapels/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to chapels_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_chapel
      @o_single = Chapel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapel_params
      params.require(:chapel).permit(:name, :is_active)
    end
    
    #fetch search records
    def get_records(search, page)
      chapel_query = Chapel.search(search)
      chapel_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @chapels = true
    end
    
    #column sort
    def sort_column
      Chapel.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
