class EmailConfirmationsController < ApplicationController
  

  def new
	

  end

  def create
		flash[:notice] = [:params][:id].inspect
		redirect_to(new_member_registration_path)
		return
    @member = Member.find(:id)
	@member.send_confirmation_email(id, email)
  end

  def resend_new
	member = Member.find_by_email(params[:email])
	if member
		if member.status == 3
			email_confirmation.destroy
			member.send_confirmation_email(member.id, email)
		elsif member.status == 2 or member.status == 1
			render 'new'
			flash.now[:notice] = "This email has already been confirmed."
		end
	else
		render 'new'
		flash.now[:notice] = "This email has not been registered"
	end
  
  end

  def recreate 
	member = Member.find_by_email(params[:email])
	email_confirmation = EmailConfirmation.find_by_email(parmas[:email])
	if member
	
		if email_confirmation
			email_confirmation.destroy
			member.send_confirmation_email(member.id, email)
		
		else
			flash.now[:notice] = "This email has already been confirmed."
			render 'new'
		
		end
	else
		
		 @me
			@member.send_confirmation_email(id, email)
  			flash.now[:notice] = "This email has not been registered"
	end

  end

  def verify
	email_confirmation = EmailConfirmation.find(:first, :conditions => {:email => params[:email], :confirmation_token => params[:confirmation_token]})

  	if email_confirmation


		if email_confirmation.action == 'new'
		        unless Member.update(email_confirmation.member_id, :status => 4)
				raise ActiveRecord::Rollback
			end	
			flash[:notice] = 'Your email has been confirmed. You can now sign in.'
			#automatically sign them in to account. There is a devise function for it
			redirect_to(new_member_registration_path)
		
		elsif email_confirmation.action == 'change'

			unless Member.update(email_confirmation.member_id,:email => email)
				raise ActiveRecord::Rollback
			end	
			flash[:notice] = 'Your new email has been confirmed. Please use this email to sign in from now on.'
		end
		
		unless email_confirmation.destroy
			raise ActiveRecord::Rollback			
		end
       
	else
		flash[:notice] = "This email has either already been verified or you've clicked the wrong link."
		redirect_to(new_member_session_path)	
	end

  end

end
