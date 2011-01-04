class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :models do |t|
      t.integer :user_id
      t.string :gender
      t.date :DOB
      t.integer :height
      t.integer :weight
      t.integer :measurement_chest
      t.integer :measurement_waist
      t.integer :measurement_hip
      t.decimal :shoe_size
      t.text :bio
      t.string :contact_email
      t.string :facebook
      t.string :phone
      t.timestamps
    end
  end

  def self.down
    drop_table :models
  end
end
