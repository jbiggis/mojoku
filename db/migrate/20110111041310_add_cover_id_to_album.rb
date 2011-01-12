class AddCoverIdToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :cover_id, :integer, :default => 0
  end

  def self.down
    remove_column :albums, :cover_id
  end
end
