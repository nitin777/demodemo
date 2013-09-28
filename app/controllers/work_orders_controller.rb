class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /work_orders
  # GET /work_orders.json
  def index
    @o_all = get_records(params[:work_order], params[:page])
    @params_arr = ['first_name, last_name, middle_name']
    @o_single = controller_name.classify.constantize.new
    session[:search_params] = params[:work_order] ? params[:work_order] : nil
  end

  def show_work_order_search
    @o_single = WorkOrder.new
  end

  # GET /work_orders/1
  # GET /work_orders/1.json
  def show
  end

  # GET /work_orders/new
  def new
    @o_single = WorkOrder.new
  end

  # GET /work_orders/1/edit
  def edit
  end

  # POST /work_orders
  # POST /work_orders.json
  def create
    @o_single = WorkOrder.new(work_order_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to work_orders_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_orders/1
  # PATCH/PUT /work_orders/1.json
  def update
    respond_to do |format|
      if @o_single.update(work_order_params)
        format.html { redirect_to work_orders_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_orders/1
  # DELETE /work_orders/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to work_orders_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @o_single = WorkOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_order_params
      params.require(:work_order).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      work_order_query = @cemetery.work_orders.search(search)
      work_order_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @maintenance_active = "active"
    end
    
    #column sort
    def sort_column
      WorkOrder.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
