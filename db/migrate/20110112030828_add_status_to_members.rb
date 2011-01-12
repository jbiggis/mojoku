class AddStatusToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :status, :integer
  end

  def self.down
    remove_column :members, :status
  end
end
