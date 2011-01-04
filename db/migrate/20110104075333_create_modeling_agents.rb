class CreateModelingAgents < ActiveRecord::Migration
  def self.up
    create_table :modeling_agents do |t|
      t.integer :user_id
      t.string :gender
      t.date :DOB
      t.text :bio
      t.string :contact_email
      t.string :facebook
      t.string :phone
      t.timestamps
    end
  end

  def self.down
    drop_table :modeling_agents
  end
end
