class Photographer < ActiveRecord::Base
  attr_accessible :bio

  #validates :bio, :length => 200

  belongs_to :member
end
