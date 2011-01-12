class RelationshipsController < ApplicationController
  def create
	
	  @member = Member.find(params[:id])
	  @member.relationships.create!(:follower_id => current_member.id) 

#	  relationship = Relationship.where('member_id == ? AND follower_id == ?', params[:id], current_member.id)
#	  if relationship.empty?
#	  	@member.relationships.create!(:follower_id => current_member.id) 
#	  end
  end

end
