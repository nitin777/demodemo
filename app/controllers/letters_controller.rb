class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /letters
  # GET /letters.json
  def index
    session[:letters] = params[:letters] if params[:letters]
    @o_all = get_records(params[:letter], params[:page])
    @search_fields = ['subject']
  end

  def show_letter_search
    @o_single = Letter.new
  end

  # GET /letters/1
  # GET /letters/1.json
  def show
  end

  # GET /letters/new
  def new
    @o_single = Letter.new
  end

  # GET /letters/1/edit
  def edit
  end

  # POST /letters
  # POST /letters.json
  def create
    @o_single = Letter.new(letter_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to letters_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letters/1
  # PATCH/PUT /letters/1.json
  def update
    respond_to do |format|
      if @o_single.update(letter_params)
        format.html { redirect_to letters_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to letters_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @o_single = Letter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_params
      params.require(:letter).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      if session[:letters] == 'true'
        letter_query = @cemetery.letters.all_letters.search(search)
      else
        letter_query = @cemetery.letters.all_certificates.search(search)
      end  
      letter_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @cemetery_active = "active"
    end
    
    #column sort
    def sort_column
      Letter.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end  
end
