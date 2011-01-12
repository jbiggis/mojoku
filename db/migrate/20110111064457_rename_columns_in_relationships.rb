class RenameColumnsInRelationships < ActiveRecord::Migration
  def self.up
	  rename_column :relationships, :follower_id, :member_id
	  rename_column :relationships, :following_id, :follower_id
  end

  def self.down
	  rename_column :relationships, :member_id, :follower_id
	  rename_column :relationships, :follower_id, :following_id
  end
end
