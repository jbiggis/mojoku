
class Members::RegistrationsController < Devise::RegistrationsController
	
  def create
  	
		build_resource
	  	resource.status = 3  ## set status to 'unconfirmed'
#		flash[:notice] = resource.inspect
#		redirect_to(new_member_registration_path)
#		return
		
		Member.transaction do
			
			if resource.save
				
				if resource.role == 'individual'
					###			
				elsif resource.role == 'model'
	    				
					unless resource.create_model
			  			raise ActiveRecord::Rollback
					end
				elsif resource.role == 'photographer'
	    	 			unless resource.create_photographer
						raise ActiveRecord::Rollback
					end
	    			elsif resource.role == 'modeling_agent'
	    				unless resource.create_modeling_agent
						raise ActiveRecord::Rollback
					end
				end
			
				#send_confirmation_email is a Class Method in Member.rb
				#resource.send_confirmation_email(resource.id, resource.email)
				render 'registered'
				return


				#redirect_to :controller => 'email_confirmations', :action => 'create'			# redirect_to "we have send you an email confirmation. You have to confirm it before you can sign in"


  #    	if resource.active?
   #     	set_flash_message :notice, :signed_up
    #    	sign_in_and_redirect(resource_name, resource)
#					return
 #     	else
  #      	set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s
   #     	expire_session_data_after_sign_in!
    #    	redirect_to after_inactive_sign_up_path_for(resource)
     # 	end
    
		 	end
  
		clean_up_passwords(resource)
  		render_with_scope :new
   	
		end

  end

  def update
    
    if resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated
      sign_in resource_name, resource, :bypass => true
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render 'members/edit_password'
    end
  end


  def registered
	
  end

  def resend_first_confirmation
	
	

	if current_member.email_confirmation.update_attributes(:confirmation_sent => Time.now)
		
		ConfirmationMailer.confirmation_email(current_member.email_confirmation.email, current_member.email_confirmation.confirmation_token).deliver
		flash[:notice] = "A confirmation has been sent to your email again, Please check your junk folder if you don't see it in your inbox."
		redirect_to :action => 'edit_email'
		return
	else
	
		flash.now[:notice] = "There was an error"
		render 'edit_email'
	end

end


def fb_registration
end

end


