class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships, :id => false do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
