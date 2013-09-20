class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.references :cemetery
      t.references :user
      t.references :folder
      t.string :name
      t.string :document_type
      t.string :file_path
      t.string :file_content_type
      t.float :file_size, :default => 0
      t.boolean :is_folder, :default => true
      t.timestamps
    end
  end
end
