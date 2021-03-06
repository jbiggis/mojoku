class AddColumnsToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :username, :string
    add_column :members, :gender, :string
    add_column :members, :DOB, :date
    add_column :members, :role, :string
    add_column :members, :phone, :string
    add_column :members, :facebook, :string
    add_column :members, :twitter, :string
  end

  def self.down
    remove_column :members, :twitter
    remove_column :members, :facebook
    remove_column :members, :phone
    remove_column :members, :role
    remove_column :members, :DOB
    remove_column :members, :gender
    remove_column :members, :username
  end
end
