class CreateGranteeGraves < ActiveRecord::Migration
  def change
    create_table :grantee_graves do |t|
      t.references :user
      t.references :grantee
      t.references :grave
      t.references :identity
      t.references :catalog
      t.references :payment_status
      t.string   "grantee_identity_number"
      t.string   "receipt_number"
      t.string   "control_number"
      t.string   "invoice_number"
      t.date     "date_of_purchase"
      t.integer  "cost"
      t.date     "tenure_expiry_date"
      t.timestamps
    end
  end
end
