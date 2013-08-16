class CreateMonuments < ActiveRecord::Migration
  def change
    create_table :monuments do |t|
      t.references :cemetery
      t.string   "name"
      t.string   "grave_position"
      t.string   "depth"
      t.string   "width"
      t.string   "length"
      t.references :unit_type      
      t.text     "comment_1"
      t.text     "comment_2"
      t.boolean  "is_active",                     default: true           
      t.timestamps
    end
  end
end
