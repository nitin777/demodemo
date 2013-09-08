class RenameColumnToLetters < ActiveRecord::Migration
  def self.up
    rename_column :letters, :certificate_name, :letter_type
  end

  def self.down
  end
end
