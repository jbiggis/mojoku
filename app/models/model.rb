class Model < ActiveRecord::Base
  attr_accessible :user_id, :name, :gender, :DOB, :height, :weight, :measurement_chest, :measurement_waist, :measurement_hip, :shoe_size, :bio, :contact_email, :facebook, :phone
end
