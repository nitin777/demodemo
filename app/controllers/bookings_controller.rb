class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /bookings
  # GET /bookings.json
  def index
    
    session[:bookings] = params[:bookings] if params[:bookings]
    if session[:bookings]
      session[:interments] = nil
      @o_all = get_bookings(params[:booking], params[:page])
    end
    
    session[:interments] = params[:interments] if params[:interments]
    if session[:interments]
      session[:bookings] = nil
      @o_all = get_interments(params[:booking], params[:page])
    end    
    
    @search_fields = ['deceased_surname', 'deceased_first_name', 'deceased_middle_name']
    
    session[:booking] = params[:booking] if params[:booking]

       
    if params[:id]
      booking = Booking.find(params[:id])
      if booking
        if booking.is_finalized
          finalize = false
          flash[:notice] = t("general.successfully_moved_to_bookings")
        else
         finalize = true
         flash[:notice] = t("general.successfully_finalized")
        end
        booking.is_finalized = finalize
        booking.save
      end
    end
  end

  def show_booking_search
    @o_single = Booking.new
  end
  
  def print_letter
    letter = Letter.find(params[:id])
    
    content = letter.content.html_safe
    
    subject = letter.subject
    subject = subject.gsub(" ", "_")
    subject = subject.to_s + ".pdf"
    
    #content to pdf
    kit = PDFKit.new(content)
    pdf = kit.to_pdf
    
    #download pdf
    send_data pdf, :filename => subject, :type => "application/pdf"
    
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @o_single = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @o_single = Booking.new(booking_params)
    chapel_ids = params[:chapel_ids].join(",").to_s
    room_ids = params[:room_ids].join(",").to_s
    respond_to do |format|
      if @o_single.save
        @o_single.chapel_ids = chapel_ids
        @o_single.room_ids = room_ids
        @o_single.save        
        format.html { redirect_to bookings_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
    chapel_ids = params[:chapel_ids].join(",").to_s
    room_ids = params[:room_ids].join(",").to_s  
      if @o_single.update(booking_params)
        @o_single.chapel_ids = chapel_ids
        @o_single.room_ids = room_ids
        @o_single.save        
        format.html { redirect_to bookings_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @o_single = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit!
    end
    
    #fetch search records
    def get_bookings(search, page)
      booking_query = @cemetery.bookings.unfinalize.search(search)
      booking_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end   
    
    #fetch search records
    def get_interments(search, page)
      booking_query = @cemetery.bookings.finalize.search(search)
      booking_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end     
    
    #set header menu active
    def set_header_menu_active
      @bookings = true
    end
    
    #column sort
    def sort_column
      Booking.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
