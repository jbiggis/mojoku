class Members::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  include Devise::Controllers::InternalHelpers


  # POST /resource/sign_in
  def create
  
    @member = Member.find_by_email(params[:member][:email])
    
    if @member 

	    if @member.status == 1 || @member.status == 2

	    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
	    set_flash_message(:notice, :signed_in) #if is_navigational_format?
	    sign_in(resource_name, resource)
	    #respond_with resource, :location => redirect_location(resource_name, resource)
	redirect_to "/member/home"	
	    
	    elsif @member.status == 3

		flash[:notice] = "Your email has not yet been confirmed"
		render 'unconfirmed'
		#redirect_to "/sign_up"#:controller => 'email_confirmations', :action => 'new', :id => params[:member][:email]
	    
	    else
		
		flash[:notice] = "This account has either been suspended, deactivated, or deleted. Fuck off."
		redirect_to(new_member_session_path)
	    
	    end
    else
	    flash.now[:notice] = "Email/password combination incorrect"
	    render_with_scope :new
    end

  end

  def resend_first_confirmation

	if email_confirmation = EmailConfirmation.find_by_email(params[:member][:email])
		if email_confirmation.update_attributes(:confirmation_sent => Time.now)
			
			ConfirmationMailer.confirmation_email(email_confirmation.email, email_confirmation.confirmation_token).deliver
			flash[:notice] = "A confirmation has been resent to your email, Please check your junk folder if you don't see it in your inbox."
			redirect_to :action => 'new'
			return
		else
		
			flash.now[:notice] = "There was an error"
			render 'unconfirmed'
		end
	else
		flash[:notice] = "You're caught, hacker!"
		redirect_to :action => 'new'
	end
  end
end

