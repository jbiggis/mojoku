class ChangeNameInMembers < ActiveRecord::Migration
  def self.up
	  remove_column :members, :name
	  add_column :members, :first_name, :string
	  add_column :members, :last_name, :string

  end

  def self.down
	  add_column :members, :name, :string
	  remove_column :members, :first_name
	  remove_column :members, :last_name

  end
end
