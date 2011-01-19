class AddStatusToProfilePic < ActiveRecord::Migration
  def self.up
	  add_column :profile_pics, :status, :integer
  end

  def self.down
	  remove_column :profile_pics, :status
  end
end
