class MemberController < ApplicationController
  
    layout "member"
	
  def home
  end

  def profile
  @member = Member.find(current_member.id)

  end

  def editprofile
	

	  redirect_to :action => 'edit_personal_details'

  end

  def edit_profile_pic
  @member = Member.find(current_member.id)
     render :layout => "member_profile"
  end

  def edit_email
  @member = Member.find(current_member.id)
     render :layout => "member_profile"
  end

  def edit_password
	    @member = Member.find(current_member.id)
     render :layout => "member_profile"
  end

  def edit_personal_details
	    @member = Member.find(current_member.id)
   render :layout => "member_profile"
  end

  def edit_contact_info
	    @member = Member.find(current_member.id)
   render :layout => "member_profile"
  end

  def updateprofile
  @member = Member.find(current_member.id)
    if @member.update_attributes(params[:member]) && @member.model.update_attributes(params[:member][:model_attributes])
      flash[:notice] = "Successfully updated member."
@params = params[:member]
      
#redirect_to :action => 'home'
    else
      render :action => 'editprofile'
    end
	  end

  def portfolio
  end

end
