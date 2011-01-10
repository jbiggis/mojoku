class Album < ActiveRecord::Base
  attr_accessible :member_id, :title, :description

  has_many :album_images, :dependent => :destroy

  accepts_nested_attributes_for :album_images, :reject_if => lambda { |t| t['album_image'].nil? }

end