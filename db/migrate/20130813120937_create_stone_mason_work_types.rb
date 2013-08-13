class CreateStoneMasonWorkTypes < ActiveRecord::Migration
  def change
    create_table :stone_mason_work_types do |t|
      t.string   "name"
      t.boolean  "is_active",                     default: true
      t.timestamps
    end
  end
end
