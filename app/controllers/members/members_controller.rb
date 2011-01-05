
class Members::MembersController < Devise::RegistrationsController

  def edit

	@member = Member.find(current_member.id)

  end



end


