class CreateGraveStatuses < ActiveRecord::Migration
  def change
    create_table :grave_statuses do |t|
      t.string   "name"
      t.boolean  "is_active",                     default: true
      t.timestamps
    end
  end
end
