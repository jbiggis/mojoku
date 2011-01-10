class ModelingAgent < ActiveRecord::Base
  
  belongs_to :member
  
  attr_accessible :bio

  #validates :bio, :length => 200


end
