class AddFbIdToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :fb_id, :integer
  
    add_index :members, :fb_id, :unique => true
   
  end

  def self.down
    remove_column :members, :fb_id
  end
end
