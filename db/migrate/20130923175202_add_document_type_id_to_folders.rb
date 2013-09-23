class AddDocumentTypeIdToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :document_type_id, :integer
  end
end
