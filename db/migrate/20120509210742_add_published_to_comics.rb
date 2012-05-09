class AddPublishedToComics < ActiveRecord::Migration
  def change
    add_column :comics, :published, :boolean
  end
end
