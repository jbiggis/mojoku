class Relationship < ActiveRecord::Base

	
validates :follower_id, :uniqueness => {:scope => :member_id}

end
