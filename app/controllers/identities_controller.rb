class IdentitiesController < ApplicationController
  before_action :set_identity, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_admin
  before_action :set_header_menu_active
  # GET /identities
  # GET /identities.json
  def index
    @o_all = get_records(params[:identity], params[:page])
    @params_arr = ['name']
    @o_single = controller_name.classify.constantize.new
    session[:search_params] = params[:identity] ? params[:identity] : nil
  end

  def show_identity_search
    @o_single = Identity.new
  end

  # GET /identities/1
  # GET /identities/1.json
  def show
  end

  # GET /identities/new
  def new
    @o_single = Identity.new
  end

  # GET /identities/1/edit
  def edit
  end

  # POST /identities
  # POST /identities.json
  def create
    @o_single = Identity.new(identity_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to identities_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /identities/1
  # PATCH/PUT /identities/1.json
  def update
    respond_to do |format|
      if @o_single.update(identity_params)
        format.html { redirect_to identities_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /identities/1
  # DELETE /identities/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to identities_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_identity
      @o_single = Identity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def identity_params
      params.require(:identity).permit(:name, :is_active)
    end
    
    #fetch search records
    def get_records(search, page)
      identity_query = Identity.search(search)
      identity_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @admin_active = "active"
    end
    
    #column sort
    def sort_column
      Identity.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
