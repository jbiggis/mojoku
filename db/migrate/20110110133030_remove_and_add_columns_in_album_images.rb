class RemoveAndAddColumnsInAlbumImages < ActiveRecord::Migration
  def self.up
  	remove_column :album_images, :title
	remove_column :album_images, :description
	add_column :album_images, :caption, :string

  end

  def self.down
    	add_column :album_images, :title, :string
	add_column :album_images, :description, :text
	remove_column :album_images, :caption
  
  end
end
