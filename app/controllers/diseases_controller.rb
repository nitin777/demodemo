class DiseasesController < ApplicationController
  before_action :set_disease, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_admin
  before_action :set_header_menu_active
  # GET /diseases
  # GET /diseases.json
  def index
    @o_all = get_records(params[:disease], params[:page])
    @search_fields = ['name']
    session[:disease] = params[:disease] if params[:disease]
  end

  def show_disease_search
    @o_single = Disease.new
  end

  # GET /diseases/1
  # GET /diseases/1.json
  def show
  end

  # GET /diseases/new
  def new
    @o_single = Disease.new
  end

  # GET /diseases/1/edit
  def edit
  end

  # POST /diseases
  # POST /diseases.json
  def create
    @o_single = Disease.new(disease_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to diseases_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diseases/1
  # PATCH/PUT /diseases/1.json
  def update
    respond_to do |format|
      if @o_single.update(disease_params)
        format.html { redirect_to diseases_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diseases/1
  # DELETE /diseases/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to diseases_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_disease
      @o_single = Disease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disease_params
      params.require(:disease).permit(:name, :is_active)
    end
    
    #fetch search records
    def get_records(search, page)
      disease_query = Disease.search(search)
      disease_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @admin_active = "active"
    end
    
    #column sort
    def sort_column
      Disease.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
