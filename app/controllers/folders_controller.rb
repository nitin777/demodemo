class FoldersController < ApplicationController
  #require 'crypt/blowfish'
  require 'open-uri' 
  before_action :set_folder, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :require_user
  before_action :set_header_menu_active
  
  # GET /folders
  # GET /folders.json
  def index
    session[:parent_folder_id] = nil
    #@o_all = Folder.joins("LEFT OUTER JOIN document_shares ON folders.id = document_shares.folder_id LEFT OUTER JOIN users ON folders.user_id = users.id").where("folders.folder_id IS NULL and users.id = ?", current_user.id).order("folders.is_folder desc").paginate(:per_page => 10, :page => params[:page])
    @o_all = current_user.folders.parent_folders.order("is_folder desc").paginate(:per_page => 10, :page => params[:page])
    @o_single = Folder.new
    @folder = session[:folder_temp_id] ? (Folder.find(session[:folder_temp_id])) : nil
  end
  
  def sub_folders
    session[:parent_folder_id] = params[:parent_folder_id] if params[:parent_folder_id]
    @folder = session[:folder_temp_id] ? (Folder.find(session[:folder_temp_id])) : nil
    @o_single = Folder.new
    
    if session[:parent_folder_id]
      @o_folder = Folder.find(params[:parent_folder_id])
      @o_all = @o_folder.folders.paginate(:per_page => 10, :page => params[:page]) 
    else
      @o_all = current_user.folders.parent_folders.paginate(:per_page => 10, :page => params[:page])
    end
    
    @folder_tree = []
    if session[:parent_folder_id]
      fld = Folder.find(session[:parent_folder_id])
      @folder_tree << fld.name
      while fld.folder_id
        @folder_tree << fld.name
        fld = Folder.find(fld.folder_id)
      end
    end
    
    render action: 'index'
  end
  
  def shared_documents_with_you
    @shared_documents = current_user.document_shares.includes(:folder).paginate(:per_page => 10, :page => params[:page])    
  end
  
  def download 
    file = Folder.find_by_file_name(params[:name].gsub(",", "."))
    if file and file.file_path
      data = open("#{Rails.root}/public#{file.file_path.to_s}")
      send_data  data.read,
                  :filename => file.file_name,
                  :type => "application/force-download",
                  :disposition => 'attachment'
    else
      flash[:notice] = t("general.file_does_not_exist")
      redirect_to folders_path              
    end                  
  end  
  
  # GET /folders/1
  # GET /folders/1.json
  def show
  end

  # GET /folders/new
  def new
    @o_single = Folder.new
  end

  # GET /folders/1/edit
  def edit
  end

  # POST /folders
  # POST /folders.json
  def create
    @o_single = Folder.new(folder_params)     
    respond_to do |format|
      if @o_single.save
        notice = t("general.successfully_created")
        if params[:folder] and params[:folder][:file_path]
          @o_single.file_size = @o_single.file_path.size.to_f          
          @o_single.file_content_type = params[:folder][:file_path].content_type
          @o_single.file_name = @o_single.file_path.filename
          
          @o_single.save
          session[:folder_temp_id] = @o_single.id
          notice = t("general.successfully_created")
        end
        
        r_url = session[:parent_folder_id] ? sub_folders_url(session[:parent_folder_id]) : folders_url
        format.html { redirect_to r_url, notice: notice }
        format.json { render action: 'show', status: :created, location: @o_single }
      else
        format.html { render action: 'new' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @o_single.update_attributes(folder_params)
        r_url = session[:parent_folder_id] ? sub_folders_url(session[:parent_folder_id]) : folders_url
        format.html { redirect_to r_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @o_single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @o_single.destroy
    respond_to do |format|
      r_url = session[:parent_folder_id] ? sub_folders_url(session[:parent_folder_id]) : folders_url
      format.html { redirect_to r_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @o_single = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit!
    end
    
    def get_records(search, page)
      folder_query = current_user.folders.all
      folder_query.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
    end    
    
    def set_header_menu_active
      @cemetery_active = true
    end
    
    def sort_column
      Folder.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
      
end
