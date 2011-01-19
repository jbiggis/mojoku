class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections, :id => false do |t|
      t.integer :member_id
      t.integer :album_id
      t.timestamps
    end
  end

  def self.down
    drop_table :collections
  end
end
