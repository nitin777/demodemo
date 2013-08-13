class CreateStoneMasons < ActiveRecord::Migration
  def change
    create_table :stone_masons do |t|
      t.references :cemetery
      t.references :stone_mason_work_type
      t.string  "bond"
      t.string  "annual_license_fee"
      t.string  "abn_acn_number"
      t.string  "contractors_license_number"
      t.string  "general_induction_cards"
      t.string  "operator_licenses"
      t.string  "list_current_employees"
      t.string  "list_contractors"
      t.boolean  "is_active",                 default: true
      t.timestamps
    end
  end
end
