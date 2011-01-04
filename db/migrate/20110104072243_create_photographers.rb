class CreatePhotographers < ActiveRecord::Migration
  def self.up
    create_table :photographers do |t|
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
    drop_table :photographers
  end
end
