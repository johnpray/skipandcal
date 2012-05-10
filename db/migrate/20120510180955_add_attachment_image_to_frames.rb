class AddAttachmentImageToFrames < ActiveRecord::Migration
  def self.up
    add_column :frames, :image_file_name, :string
    add_column :frames, :image_content_type, :string
    add_column :frames, :image_file_size, :integer
    add_column :frames, :image_updated_at, :datetime
  end

  def self.down
    remove_column :frames, :image_file_name
    remove_column :frames, :image_content_type
    remove_column :frames, :image_file_size
    remove_column :frames, :image_updated_at
  end
end
