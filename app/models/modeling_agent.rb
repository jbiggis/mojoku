class ModelingAgent < ActiveRecord::Base
  attr_accessible :user_id, :gender, :DOB, :bio, :contact_email, :facebook, :phone
end
