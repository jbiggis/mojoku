class Model < ActiveRecord::Base


  belongs_to :member
	

  attr_accessible :height, :weight, :measurement_chest, :measurement_waist, :measurement_hip, :shoe_size, :bio


end
