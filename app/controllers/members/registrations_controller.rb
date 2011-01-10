
class Members::RegistrationsController < Devise::RegistrationsController
	
  def create
  	
		build_resource
	  
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

      	if resource.active?
        	set_flash_message :notice, :signed_up
        	sign_in_and_redirect(resource_name, resource)
					return
      	else
        	set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s
        	expire_session_data_after_sign_in!
        	redirect_to after_inactive_sign_up_path_for(resource)
      	end
    
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


end


