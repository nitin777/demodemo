class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.references :cemetery
      t.string   "code"
      t.text     "description"
      t.string   "control_number"
      t.string   "name"
      t.string   "user"
      t.string   "map"
      t.boolean  "is_active",                      default: true
      t.timestamps
    end
  end
end
