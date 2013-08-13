class CreateCoffins < ActiveRecord::Migration
  def change
    create_table :coffins do |t|
      t.string   "name"
      t.boolean  "is_active",                     default: true
      t.timestamps
    end
  end
end
