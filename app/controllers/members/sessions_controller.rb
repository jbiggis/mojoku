class Members::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  include Devise::Controllers::InternalHelpers


  # POST /resource/sign_in
  def create
  
    @member = Member.find_by_email(params[:member][:email])
    
    if @member.status == 1 || @member.status == 2

    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    set_flash_message(:notice, :signed_in) #if is_navigational_format?
    sign_in(resource_name, resource)
    #respond_with resource, :location => redirect_location(resource_name, resource)
redirect_to "/member/home"	
    
    elsif @member.status == 3

	flash[:notice] = "Your email has not yet been confirmed"
	redirect_to :controller => 'email_confirmations', :action => 'new'
    
    else
	
	flash[:notice] = "This account has either been suspended, deactivated, or deleted. Fuck off."
	redirect_to(new_member_session_path)
    
    end
  
  end

end

