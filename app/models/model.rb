class Model < ActiveRecord::Base
  attr_accessible :height, :weight, :measurement_chest, :measurement_waist, :measurement_hip, :shoe_size, :bio

  belongs_to :member
end
