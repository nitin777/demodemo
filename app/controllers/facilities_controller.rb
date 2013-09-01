class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /facilities
  # GET /facilities.json
  def index
    @o_all = get_records(params[:facility], params[:page])
    @search_fields = ['surname', 'first_name', 'middle_name']
    session[:facility] = params[:facility] if params[:facility]
  end

  def show_facility_search
    @o_single = Facility.new
  end

  # GET /facilities/1
  # GET /facilities/1.json
  def show
  end

  # GET /facilities/new
  def new
    @o_single = Facility.new
  end

  # GET /facilities/1/edit
  def edit
  end

  # POST /facilities
  # POST /facilities.json
  def create
    @o_single = Facility.new(facility_params)
    chapel_ids = params[:chapel_ids].join(",").to_s
    room_ids = params[:room_ids].join(",").to_s
    respond_to do |format|
      if @o_single.save
        @o_single.chapel_ids = chapel_ids
        @o_single.room_ids = room_ids
        @o_single.save        
        format.html { redirect_to facilities_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilities/1
  # PATCH/PUT /facilities/1.json
  def update
    
    chapel_ids = params[:chapel_ids].join(",").to_s
    room_ids = params[:room_ids].join(",").to_s
    respond_to do |format|
      if @o_single.update(facility_params)
        @o_single.chapel_ids = chapel_ids
        @o_single.room_ids = room_ids
        @o_single.save
        format.html { redirect_to facilities_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1
  # DELETE /facilities/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to facilities_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @o_single = Facility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facility_params
      params.require(:facility).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      facility_query = @cemetery.facilities.search(search)
      facility_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @facilities = true
    end
    
    #column sort
    def sort_column
      Facility.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
