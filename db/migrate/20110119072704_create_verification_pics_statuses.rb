class CreateVerificationPicsStatuses < ActiveRecord::Migration
  def self.up
    create_table :verification_pics_statuses do |t|
      t.string :label

      t.timestamps
    end
  end

  def self.down
    drop_table :verification_pics_statuses
  end
end
