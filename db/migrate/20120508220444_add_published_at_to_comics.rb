class AddPublishedAtToComics < ActiveRecord::Migration
  def change
    add_column :comics, :published_at, :datetime
  end
end
