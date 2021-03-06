class VerificationPicsController < ApplicationController
  def new
  	@member = Member.find(current_member.id)
  	@verification_pics = @member.verification_pics
	if @verification_pics.empty?
		@member.verification_pics.build
	end
  end

  def create

	  	unless current_member.verification_pics.create(params[:member][:verification_pic])
			flash.now[:notice] = "There was an error encountered."
			render verification_path
			return
		end
		if pic = current_member.verification_pics.find(:first, :conditions => 'status = 3')
			pic.update_attributes(:status => 4)

		end
		
       	flash[:notice] = "Successfully upload verification picture."

	 redirect_to (verification_path)
  end


def cancel
	current_member.verification_pics.find(:last, :conditions => 'status = 1').update_attributes(:status => 4)
	redirect_to(verification_path)
end

def show_verification_pics
	@verification_pics = VerificationPic.find(:all, :conditions => 'status = 1')
	@verification_pic_statuses = VerificationPicsStatus.all
end

def verification_pic_status_update

	VerificationPic.update(params[:verification_pic][:id], :status => params[:verification_pic][:status])

		redirect_to (show_verification_pics_path)
end

  def show
	@profile_pics = ProfilePic.find(:all, :conditions => 'status = 1')
	@profile_pic_statuses = ProfilePicStatus.all

  end

  def status_update
	if params[:profile_pic][:status] == 1
		if pic = ProfilePic.find(:first, :conditions => 'status = 2' )
			pic.update_attributes(:status => 4)	
		end
	end
	ProfilePic.update(params[:profile_pic][:id], :status => params[:profile_pic][:status])

		redirect_to (verification_path)
  end


end
