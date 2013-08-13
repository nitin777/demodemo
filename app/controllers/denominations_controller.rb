class DenominationsController < ApplicationController
  before_action :set_denomination, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_admin
  before_action :set_header_menu_active
  # GET /denominations
  # GET /denominations.json
  def index
    @o_all = get_records(params[:denomination], params[:page])
    session[:denomination] = params[:denomination] if params[:denomination]
  end

  def show_denomination_search
    @o_single = Denomination.new
  end

  # GET /denominations/1
  # GET /denominations/1.json
  def show
  end

  # GET /denominations/new
  def new
    @o_single = Denomination.new
  end

  # GET /denominations/1/edit
  def edit
  end

  # POST /denominations
  # POST /denominations.json
  def create
    @o_single = Denomination.new(denomination_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to denominations_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /denominations/1
  # PATCH/PUT /denominations/1.json
  def update
    respond_to do |format|
      if @o_single.update(denomination_params)
        format.html { redirect_to denominations_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /denominations/1
  # DELETE /denominations/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to denominations_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_denomination
      @o_single = Denomination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def denomination_params
      params.require(:denomination).permit(:name, :is_active)
    end
    
    #fetch search records
    def get_records(search, page)
      denomination_query = Denomination.search(search)
      denomination_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @denominations = true
    end
    
    #column sort
    def sort_column
      Denomination.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end       
  
end
