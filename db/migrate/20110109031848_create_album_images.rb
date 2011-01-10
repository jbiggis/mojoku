class CreateAlbumImages < ActiveRecord::Migration
  def self.up
    create_table :album_images do |t|
      t.integer :album_id
      t.string :title
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :album_images
  end
end
