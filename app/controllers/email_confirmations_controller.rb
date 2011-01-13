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

 
  def verify
	email_confirmation = EmailConfirmation.find(:first, :conditions => {:email => params[:email], :confirmation_token => params[:confirmation_token]})

  	if email_confirmation


		if email_confirmation.action == 'new'
		        unless Member.update(email_confirmation.member_id, :status => 2)
				raise ActiveRecord::Rollback
			end	
			flash[:notice] = 'Your email has been confirmed. You can now sign in.'
			#automatically sign them in to account. There is a devise function for it
			redirect_to(new_member_registration_path)
		
		elsif email_confirmation.action == 'change'

			unless Member.update(email_confirmation.member_id,:email => email_confirmation.email)
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
  def resend_first_confirmation

	if email_confirmation = EmailConfirmation.find_by_email(params[:email])
		if email_confirmation.update_attributes(:confirmation_sent => Time.now)
			
			#ConfirmationMailer.confirmation_email(email_confirmation.email, email_confirmation.confirmation_token).deliver
			flash[:notice] = "A confirmation has been resent to your email, Please check your junk folder if you don't see it in your inbox."
			redirect_to(root_path)
			return
		else
		
			flash.now[:notice] = "There was an error"
			redirect_to(root_path)
		end
	else
		flash[:notice] = "You're caught, hacker!"
		redirect_to(root_path)
	end
  end
end
