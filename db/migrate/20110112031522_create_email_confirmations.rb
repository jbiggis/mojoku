class CreateEmailConfirmations < ActiveRecord::Migration
  def self.up
    create_table :email_confirmations do |t|
      t.integer :member_id
      t.string :email
      t.string :confirmation_token
      t.datetime :confirmation_sent

      t.timestamps
    end
  end

  def self.down
    drop_table :email_confirmations
  end
end
