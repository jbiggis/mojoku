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

  def edit_role

	  @member = Member.find(current_member.id)
   render :layout => "member_profile"
  end


  def updateprofile
  @member = Member.find(current_member.id)
  
    if @member.update_attributes(params[:member])
	    
	      if @member.role == 'model'
		      
		      @member.model.update_attributes(params[:member][:model_attributes])
		      elsif @member.role == 'photographer'
		      
		      @member.photographer.update_attributes(params[:member][:photographer_attributes])
		       elsif @member.role == 'modeling_agent'
		      
		      @member.modeling_agent.update_attributes(params[:member][:modeling_agent_attributes])  
		      
		       end

		      flash[:notice] = "Successfully updated member."

      
      
      @params = params[:member]
      


#redirect_to :action => 'home'
    else
      render :action => 'editprofile'
    end
	  end

  def updaterole
  
	  @member = Member.find(current_member.id)
  
	  if @member.role != params[:role]
	  
		  @member.update_attributes(params[:member])
	        
		  flash[:notice] = "Successfully updated member."

		
		  if @member.role == 'model'
	
			if @member.model == nil
		
				@member.create_model
	
			end


		
		  elsif @member.role == 'photographer'


	
			if @member.photographer == nil
	
		
				@member.create_photographer
	

			end
	
	
		
		  elsif @member.role == 'modeling_agent'
		
			if @member.modeling_agent == nil
	
			
				@member.create_modeling_agent
	

			end

	
		
		  end


redirect_to :action => 'profile'
  else

    	  render :action => 'editprofile'
    
  end
  
  end

  def portfolio
  end

end
