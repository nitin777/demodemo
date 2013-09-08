class LetterVariablesController < ApplicationController
  before_action :set_letter_variable, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  # GET /letter_variables
  # GET /letter_variables.json
  def index
    #@o_all = get_records(params[:letter_variable], params[:page])
    @certificate = LetterVariable.certificate_variables.first
    @letter = LetterVariable.letter_variables.first
    session[:letter_variable] = params[:letter_variable] if params[:letter_variable]
  end

  def show_letter_variable_search
    @o_single = LetterVariable.new
  end

  # GET /letter_variables/1
  # GET /letter_variables/1.json
  def show
  end

  # GET /letter_variables/new
  def new
    @o_single = LetterVariable.new
  end

  # GET /letter_variables/1/edit
  def edit
  end

  # POST /letter_variables
  # POST /letter_variables.json
  def create
    @o_single = LetterVariable.new(letter_variable_params)

    respond_to do |format|
      if @o_single.save
        format.html { redirect_to letter_variables_url, notice: t("general.successfully_created") }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letter_variables/1
  # PATCH/PUT /letter_variables/1.json
  def update
    respond_to do |format|
      if @o_single.update(letter_variable_params)
        format.html { redirect_to letter_variables_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letter_variables/1
  # DELETE /letter_variables/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to letter_variables_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_letter_variable
      @o_single = LetterVariable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_variable_params
      params.require(:letter_variable).permit!
    end
    
    #fetch search records
    def get_records(search, page)
      letter_variable_query = LetterVariable.scoped
      letter_variable_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    #set header menu active
    def set_header_menu_active
      @cemetery_active = "active"
    end
    
    #column sort
    def sort_column
      LetterVariable.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    #column sort
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end       
end
