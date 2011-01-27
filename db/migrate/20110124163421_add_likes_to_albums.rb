class AddLikesToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :likes, :integer
  end

  def self.down
    remove_column :albums, :likes
  end
end
