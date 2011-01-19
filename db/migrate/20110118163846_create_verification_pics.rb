class CreateVerificationPics < ActiveRecord::Migration
  def self.up
    create_table :verification_pics do |t|
      t.integer :member_id
      t.integer :status

      t.timestamps
    end
      add_index :verification_pics, :member_id
  end

  def self.down
    drop_table :verification_pics
  end
end
