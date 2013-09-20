class CreateDocumentShares < ActiveRecord::Migration
  def change
    create_table :document_shares do |t|
      t.references :document
      t.references :user
      t.timestamps
    end
  end
end
