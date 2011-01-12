class AddActionToEmailConfirmations < ActiveRecord::Migration
  def self.up
    add_column :email_confirmations, :action, :string
  end

  def self.down
    remove_column :email_confirmations, :action
  end
end
