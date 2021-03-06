class CemeteriesController < ApplicationController
  before_action :set_cemetery, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  
  SUPER_ADMIN = "SuperAdmin"
  
  # GET /cemeteries
  # GET /cemeteries.json
  def index
    session[:cemetery_id] = nil
    @o_all = get_records(params[:cemetery], params[:page])
    @params_arr = ['name']
    @o_single = controller_name.classify.constantize.new
    session[:search_params] = params[:cemetery] ? params[:cemetery] : nil
  end

  def show_cemetery_search
    @o_single = Cemetery.new
  end

  # GET /cemeteries/1
  # GET /cemeteries/1.json
  def show
    session[:cemetery_id] = params[:id] if params[:id]
    cemetery = Cemetery.find(session[:cemetery_id])
    session[:country_id] = cemetery.country_id if cemetery
    
    redirect_to users_url
  end

  # GET /cemeteries/new
  def new
    @o_single = Cemetery.new
  end

  # GET /cemeteries/1/edit
  def edit
  end

  # POST /cemeteries
  # POST /cemeteries.json
  def create
    @o_single = Cemetery.new(cemetery_params)

    respond_to do |format|
      if @o_single.save
        add_certificates(@o_single)
        create_role_permissions(@o_single)
        format.html { redirect_to cemeteries_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cemeteries/1
  # PATCH/PUT /cemeteries/1.json
  def update
    respond_to do |format|
      if @o_single.update(cemetery_params)
        format.html { redirect_to cemeteries_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cemeteries/1
  # DELETE /cemeteries/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to cemeteries_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    def add_certificates(cemetery)
      cemetery.letters.create(:subject => "Interment Certificate", :content => "Interment Certificate", :letter_type => "interment_certificate", :is_certificate => 1)
      cemetery.letters.create(:subject => "Burial Licence", :content => "Burial Licence", :letter_type => "burial_certificate", :is_certificate => 1)
      cemetery.letters.create(:subject => "Grave Transfer", :content => "Grave Transfer", :letter_type => "grave_transfer_certificate", :is_certificate => 1)
    end  
    
    def create_role_permissions(cemetery)
      Role.where("role_type != ?", SUPER_ADMIN).each do |r|
        cemetery.role_permissions.create(:role_id => r.id)
      end
    end    
  
    # Use callbacks to share common setup or constraints between actions.
    def set_cemetery
      @o_single = Cemetery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cemetery_params
      params.require(:cemetery).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      cemetery_query = Cemetery.search(search)
      cemetery_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @cemeteties_active = "active"
    end
    
    #column sort
    def sort_column
      Cemetery.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
