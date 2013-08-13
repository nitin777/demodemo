class RowsController < ApplicationController
  before_action :set_row, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_admin
  before_action :set_header_menu_active
  # GET /rows
  # GET /rows.json
  def index
    @o_all = get_records(params[:row], params[:page])
    session[:row] = params[:row] if params[:row]
  end

  def show_row_search
    @o_single = Row.new
  end

  # GET /rows/1
  # GET /rows/1.json
  def show
  end

  # GET /rows/new
  def new
    @o_single = Row.new
  end

  # GET /rows/1/edit
  def edit
  end

  # POST /rows
  # POST /rows.json
  def create
    @o_single = Row.new(row_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to rows_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rows/1
  # PATCH/PUT /rows/1.json
  def update
    respond_to do |format|
      if @o_single.update(row_params)
        format.html { redirect_to rows_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rows/1
  # DELETE /rows/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to rows_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_row
      @o_single = Row.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def row_params
      params.require(:row).permit(:name, :is_active)
    end
    
    #fetch search records
    def get_records(search, page)
      row_query = Row.search(search)
      row_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @rows = true
    end
    
    #column sort
    def sort_column
      Row.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
