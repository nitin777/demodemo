class CreateChapels < ActiveRecord::Migration
  def change
    create_table :chapels do |t|
      t.references :cemetery
      t.string   "name"
      t.text   "description"
      t.boolean  "is_active",                     default: true
      t.timestamps
    end
  end
end
