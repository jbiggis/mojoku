class AddCoverToAlbumImages < ActiveRecord::Migration
  def self.up
    add_column :album_images, :cover, :boolean, :default => false
  end

  def self.down
    remove_column :album_images, :cover
  end
end
