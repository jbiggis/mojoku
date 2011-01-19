class Collection < ActiveRecord::Base

	validates :album_id, :uniqueness => {:scope => :member_id}


end
