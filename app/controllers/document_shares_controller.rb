class DocumentSharesController < ApplicationController
  before_action :set_document_share, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /document_shares
  # GET /document_shares.json
  def index
    session[:document_share_id] = params[:id] if params[:id]
    @o_all = get_records(params[:document_share], params[:page])
    @params_arr = ['name']
    @o_single = controller_name.classify.constantize.new
    session[:search_params] = params[:document_share] ? params[:document_share] : nil
  end

  def show_document_share_search
    @o_single = DocumentShare.new
  end

  # GET /document_shares/1
  # GET /document_shares/1.json
  def show
  end

  # GET /document_shares/new
  def new
    @o_single = DocumentShare.new
  end

  # GET /document_shares/1/edit
  def edit
  end

  # POST /document_shares
  # POST /document_shares.json
  def create
    @o_single = DocumentShare.new(document_share_params)
    respond_to do |format|
      if @o_single.save
        @o_all = get_records(params[:document_share], params[:page])
        format.html { redirect_to document_shares_url, notice: t("general.successfully_created") }
        format.json { head :no_content }
      else
        @o_all = get_records(params[:document_share], params[:page])
        format.html { render action: 'index' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_shares/1
  # PATCH/PUT /document_shares/1.json
  def update
    respond_to do |format|
      if @o_single.update(document_share_params)
        format.html { redirect_to document_shares_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_shares/1
  # DELETE /document_shares/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to document_shares_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_document_share
      @o_single = DocumentShare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_share_params
      params.require(:document_share).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      @folder = Folder.find(session[:document_share_id])
      document_share_query = @folder.document_shares
      document_share_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @cemetery_active = "active"
    end
    
    #column sort
    def sort_column
      DocumentShare.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
