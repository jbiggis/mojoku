class VerificationPic < ActiveRecord::Base

	belongs_to :member

has_attached_file :photo, :url => "/assets/verification_pics/:id/:style/:basename.:extension",
	:path => ":rails_root/public/assets/verification_pics/:id/:style/:basename.:extension"


end
