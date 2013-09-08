class CreateLetterVariables < ActiveRecord::Migration
  def change
    create_table :letter_variables do |t|
      t.text "content"
      t.boolean  "is_certificate",                     default: false      
      t.timestamps
    end
  end
end
