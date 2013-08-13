class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.references :cemetery
      t.references :area
      t.references :section
      t.references :row      
      t.string   "plot_name"
      t.string   "plot_user"
      t.string   "length"
      t.string   "width"
      t.string   "depth"
      t.string   "plot_map_path"
      t.boolean  "is_active",                 default: true
      t.timestamps
    end
  end
end
