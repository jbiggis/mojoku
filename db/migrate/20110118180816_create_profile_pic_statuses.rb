class CreateProfilePicStatuses < ActiveRecord::Migration
  def self.up
    create_table :profile_pic_statuses do |t|
      t.string :label

      t.timestamps
    end
  end

  def self.down
    drop_table :profile_pic_statuses
  end
end
