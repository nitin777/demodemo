class GraveHistoriesController < ApplicationController
  before_action :set_grave_history, only: [:edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /grave_histories
  # GET /grave_histories.json
  def index
    session[:grave_id] = params[:grave_id] if params[:grave_id]
    @o_all = get_records(params[:grave_history], params[:page])
    @search_fields = ['receipt_number']
  end

  # GET /grave_histories/1
  # GET /grave_histories/1.json
  def show
  end

  # GET /grave_histories/new
  def new
    session[:grave_transfer_id] = params[:grave_transfer_id] if params[:grave_transfer_id]
    session[:grantee_id] = params[:grantee_id] if params[:grantee_id]
    @grantee = Grantee.find(session[:grantee_id])
    @grave = Grafe.find(session[:grave_transfer_id])
    @o_single = GraveHistory.new
  end

  # GET /grave_histories/1/edit
  def edit
  end

  # POST /grave_histories
  # POST /grave_histories.json
  def create
    @o_single = GraveHistory.new(grave_history_params)
    @grantee = Grantee.find(session[:grantee_id])
    @grave = Grafe.find(session[:grave_transfer_id])    
    grantee_transfer = Grantee.find_by(:id => params[:grave_history][:entity_trasfer_id])
    if grantee_transfer
      respond_to do |format|
        if @o_single.save
          format.html { redirect_to grantee_grafe_url(@grantee), notice: t("general.successfully_created") }
          format.json { render action: 'show', status: :created, location: @o_single }
        else
          format.html { render action: 'new' }
          format.json { render json: @o_single.errors, status: :unprocessable_entity }
        end
      end  
     else
       flash[:entiry_transer_error] = t("general.entiry_transer_id_is_not_valid")
       respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }         
       end
     end
  end

  # PATCH/PUT /grave_histories/1
  # PATCH/PUT /grave_histories/1.json
  def update
    respond_to do |format|
      if @o_single.update(grave_history_params)
        format.html { redirect_to grave_histories_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grave_histories/1
  # DELETE /grave_histories/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to grave_histories_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_grave_history
      @o_single = GraveHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grave_history_params
      params.require(:grave_history).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      if session[:grave_id]
        @grave = Grafe.find(session[:grave_id])
        grave_history_query = @grave.grave_histories.search(search)
      else
        grave_history_query = GraveHistory.search(search)
      end  
      grave_history_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @cemetery_active = "active"
    end
    
    #column sort
    def sort_column
      GraveHistory.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
