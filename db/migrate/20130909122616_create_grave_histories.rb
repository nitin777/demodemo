class CreateGraveHistories < ActiveRecord::Migration
  def change
    create_table :grave_histories do |t|
      t.references :grantee
      t.integer  "grantee_trasfer_id"
      t.references :grafe
      t.references :catalog
      t.references :identity
      t.references :payment_status
      t.date     "surrender_date"
      t.string   "identity_number"
      t.string   "receipt_number"
      t.timestamps
    end
  end
end
