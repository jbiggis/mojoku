class ChangeUserIdInModels < ActiveRecord::Migration
  def self.up
	  rename_column :models, :user_id, :member_id
	  rename_column :photographers, :user_id, :member_id
	  rename_column :modeling_agents, :user_id, :member_id
  end

  def self.down
	  rename_column :models, :member_id, :user_id
	  rename_column :photographers, :member_id, :user_id
	  rename_column :modeling_agents, :member_id, :user_id

  end
end
