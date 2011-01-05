
class Members::RegistrationsController < Devise::RegistrationsController
	
  def create
   build_resource

    if resource.valid?
	
	if params[:type] == 'model'
 	    
		resource.role = 'model'
	    	resource.save

	    	resource.create_model
	    
	elsif params[:type] == 'photographer'
	    
		resource.role = 'photographer'
	    	resource.save

	    	resource.create_photographer
	    
	elsif params[:type] == 'modeling_agent'
	    
		resource.role = 'modeling_agent'
	    	resource.save
	    
		resource.create_modeling_agent
	
	end

      if resource.active?
        set_flash_message :notice, :signed_up
        sign_in_and_redirect(resource_name, resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s
        expire_session_data_after_sign_in!
        redirect_to after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end

end


