class GranteeGravesController < ApplicationController
  before_action :set_grantee_grafe, only: [:edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /grantee_graves
  # GET /grantee_graves.json
  def index
    @o_all = get_records(params[:grantee_grafe], params[:page])
    @search_fields = ['grave_id']
  end

  # GET /grantee_graves/1
  # GET /grantee_graves/1.json
  def show
    session[:grantee_id] = params[:id]
    redirect_to grantee_graves_url
  end

  # GET /grantee_graves/new
  def new
    @o_single = GranteeGrafe.new
    
    if params[:new_purchase]
      session[:grantee_id] = nil
    end
    
    if params[:grave_id]
      session[:grantee_id] = nil
      session[:grave_id] = params[:grave_id]
      @grave = Grafe.find(session[:grave_id])
    else
      session[:grave_id] = nil
    end    
  end

  # GET /grantee_graves/1/edit
  def edit
  end

  # POST /grantee_graves
  # POST /grantee_graves.json
  def create
    @o_single = GranteeGrafe.new(grantee_grafe_params)

    respond_to do |format|
      if @o_single.save
        session[:grave_id] = nil
        format.html { redirect_to grantee_graves_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        if session[:grave_id]
          @grave = Grafe.find(session[:grave_id])
        end
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grantee_graves/1
  # PATCH/PUT /grantee_graves/1.json
  def update
    respond_to do |format|
      if @o_single.update(grantee_grafe_params)
        format.html { redirect_to grantee_graves_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grantee_graves/1
  # DELETE /grantee_graves/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to grantee_graves_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_grantee_grafe
      @o_single = GranteeGrafe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grantee_grafe_params
      params.require(:grantee_grafe).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      if session[:grantee_id]
        @grantee = Grantee.find(session[:grantee_id])
        grantee_grave_query = @grantee.grantee_graves.search(search)
      else
        grantee_grave_query = GranteeGrafe.search(search)
      end  
      grantee_grave_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @cemetery_active = "active"
    end
    
    #column sort
    def sort_column
      GranteeGrafe.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
