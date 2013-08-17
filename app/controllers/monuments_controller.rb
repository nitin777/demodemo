class MonumentsController < ApplicationController
  before_action :set_monument, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /monuments
  # GET /monuments.json
  def index
    @o_all = get_records(params[:monument], params[:page])
    @search_fields = ['name']
    session[:monument] = params[:monument] if params[:monument]
  end

  def show_monument_search
    @o_single = Monument.new
  end

  # GET /monuments/1
  # GET /monuments/1.json
  def show
  end

  # GET /monuments/new
  def new
    @o_single = Monument.new
  end

  # GET /monuments/1/edit
  def edit
  end

  # POST /monuments
  # POST /monuments.json
  def create
    @o_single = Monument.new(monument_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to monuments_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monuments/1
  # PATCH/PUT /monuments/1.json
  def update
    respond_to do |format|
      if @o_single.update(monument_params)
        format.html { redirect_to monuments_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monuments/1
  # DELETE /monuments/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to monuments_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_monument
      @o_single = Monument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monument_params
      params.require(:monument).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      monument_query = @cemetery.monuments.search(search)
      monument_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @monuments = true
    end
    
    #column sort
    def sort_column
      Monument.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
