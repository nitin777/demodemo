class GranteesController < ApplicationController
  before_action :set_grantee, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /grantees
  # GET /grantees.json
  def index
    session[:grave_id] = params[:grave_id] if params[:grave_id]
    if params[:grave_id] == 'false'
      session[:grave_id] = nil
    end
    if session[:grave_id]
      @grave = Grafe.find(session[:grave_id])
    end
    @o_all = get_records(params[:grantee], params[:page], session[:grave_id])
    @search_fields = ['surname', 'first_name', 'middle_name']
    session[:grantee] = params[:grantee] if params[:grantee]
  end

  def show_grantee_search
    @o_single = Grantee.new
  end

  # GET /grantees/1
  # GET /grantees/1.json
  def show
  end

  # GET /grantees/new
  def new
    @o_single = Grantee.new
  end

  # GET /grantees/1/edit
  def edit
  end

  # POST /grantees
  # POST /grantees.json
  def create
    @o_single = Grantee.new(grantee_params)

    respond_to do |format|
      if @o_single.save
        @o_single.grantee_unique_id = @o_single.id.to_s + SecureRandom.hex(10).to_s + @o_single.id.to_s 
        @o_single.save
        format.html { redirect_to grantees_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grantees/1
  # PATCH/PUT /grantees/1.json
  def update
    respond_to do |format|
      if @o_single.update(grantee_params)
        format.html { redirect_to grantees_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grantees/1
  # DELETE /grantees/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to grantees_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_grantee
      @o_single = Grantee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grantee_params
      params.require(:grantee).permit!
    end
    
    #fetch search records
    def get_records(search, page, grave)
      if grave
        grantee_query = @cemetery.grantees.joins(:grantee_graves).where(:grantee_graves => { :grafe_id => grave }).search(search)
      else  
        grantee_query = @cemetery.grantees.search(search)
      end  
      grantee_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @cemetery_active = "active"
    end
    
    #column sort
    def sort_column
      Grantee.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
