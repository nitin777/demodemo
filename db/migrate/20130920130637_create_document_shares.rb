class CreateDocumentShares < ActiveRecord::Migration
  def change
    create_table :document_shares do |t|
      t.references :folder
      t.references :user
      t.timestamps
    end
  end
end
