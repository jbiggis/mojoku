
class ConfirmationMailer < ActionMailer::Base
	    default :from =>"jscchiu@gmail.com"
def confirmation_email(email, confirmation_token)

	@email = email
	@confirmation_token = confirmation_token


	mail(:to=> email, :subject => "Confirmation for your registration at OMyMod.com")
end


end
