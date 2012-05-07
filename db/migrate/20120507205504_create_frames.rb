class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.string :alt_text
      t.string :title_text
      t.integer :comic_id
      t.integer :order

      t.timestamps

      t.index :comic_id
    end
  end
end
