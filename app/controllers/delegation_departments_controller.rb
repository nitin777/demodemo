class DelegationDepartmentsController < ApplicationController
  before_action :set_delegation_department, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /delegation_departments
  # GET /delegation_departments.json
  def index
    @o_all = get_records(params[:delegation_department], params[:page])
    @params_arr = ['name']
    @o_single = controller_name.classify.constantize.new
    session[:search_params] = params[:delegation_department] ? params[:delegation_department] : nil
  end

  def show_delegation_department_search
    @o_single = DelegationDepartment.new
  end

  # GET /delegation_departments/1
  # GET /delegation_departments/1.json
  def show
  end

  # GET /delegation_departments/new
  def new
    @o_single = DelegationDepartment.new
  end

  # GET /delegation_departments/1/edit
  def edit
  end

  # POST /delegation_departments
  # POST /delegation_departments.json
  def create
    @o_single = DelegationDepartment.new(delegation_department_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to delegation_departments_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delegation_departments/1
  # PATCH/PUT /delegation_departments/1.json
  def update
    respond_to do |format|
      if @o_single.update(delegation_department_params)
        format.html { redirect_to delegation_departments_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delegation_departments/1
  # DELETE /delegation_departments/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to delegation_departments_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_delegation_department
      @o_single = DelegationDepartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delegation_department_params
      params.require(:delegation_department).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      delegation_department_query = @cemetery.delegation_departments.search(search)
      delegation_department_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @maintenance_active = "active"
    end
    
    #column sort
    def sort_column
      DelegationDepartment.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
