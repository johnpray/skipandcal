class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :comic_id
      t.integer :category_id

      t.timestamps

      t.index :comic_id
      t.index :category_id
    end
  end
end
