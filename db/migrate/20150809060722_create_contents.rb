class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :text
      t.string :content_img
      t.integer :note_id

      t.timestamps null: false
    end
    add_index :contents , :id
    add_index :contents , :note_id
  end
end
