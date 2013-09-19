class CreateWorkTypes < ActiveRecord::Migration
  def change
    create_table :work_types do |t|
      t.references :cemetery
      t.string :name
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end
end
