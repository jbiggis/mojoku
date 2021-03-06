class ProfilePic < ActiveRecord::Base

belongs_to :member
has_many :verification_pics, :through => :member

has_attached_file :photo, :url => "/assets/profile_pics/:id/:style/:basename.:extension",
	:path => ":rails_root/public/assets/profile_pics/:id/:style/:basename.:extension"


end
