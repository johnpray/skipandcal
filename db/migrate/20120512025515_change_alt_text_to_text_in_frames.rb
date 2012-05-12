class ChangeAltTextToTextInFrames < ActiveRecord::Migration
  def up
	change_column :frames, :alt_text, :text
  end

  def down
	change_column :frames, :alt_text, :string
  end
end
