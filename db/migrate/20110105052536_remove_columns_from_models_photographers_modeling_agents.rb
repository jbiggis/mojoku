class RemoveColumnsFromModelsPhotographersModelingAgents < ActiveRecord::Migration
  def self.up
	  remove_column :models, :gender
	  remove_column :models, :DOB
	  remove_column :models, :contact_email
	  remove_column :models, :facebook
	  remove_column :models, :phone
	  remove_column :photographers, :gender
	  remove_column :photographers, :DOB
	  remove_column :photographers, :contact_email
	  remove_column :photographers, :facebook
	  remove_column :photographers, :phone
	  remove_column :modeling_agents, :gender
	  remove_column :modeling_agents, :DOB
	  remove_column :modeling_agents, :contact_email
	  remove_column :modeling_agents, :facebook
	  remove_column :modeling_agents, :phone

  end

  def self.down
	  add_column :models, :gender, :string
	  add_column :models, :DOB, :date
	  add_column :models, :contact_email, :string
	  add_column :models, :facebook, :string
	  add_column :models, :phone, :string
	  add_column :photographers, :gender, :string
	  add_column :photographers, :DOB, :date
	  add_column :photographers, :contact_email, :string
	  add_column :photographers, :facebook, :string
	  add_column :photographers, :phone, :string
	  add_column :modeling_agents, :gender, :string
	  add_column :modeling_agents, :DOB, :date
	  add_column :modeling_agents, :contact_email, :string
	  add_column :modeling_agents, :facebook, :string
	  add_column :modeling_agents, :phone, :string
  end
end
