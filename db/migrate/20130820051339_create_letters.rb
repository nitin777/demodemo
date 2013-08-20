class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.references :cemetery
      t.string   "subject"
      t.text     "content"
      t.boolean  "is_certificate",                default: false
      t.string  "certificate_name"
      t.boolean  "is_active",                     default: true
      t.timestamps
    end
  end
end
