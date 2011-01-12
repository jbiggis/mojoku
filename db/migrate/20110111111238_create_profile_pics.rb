class CreateProfilePics < ActiveRecord::Migration
  def self.up
    create_table :profile_pics do |t|
      t.integer :member_id

      t.timestamps
    end
  end

  def self.down
    drop_table :profile_pics
  end
end
