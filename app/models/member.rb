class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :username, :gender, :DOB, :role, :phone, :facebook, :twitter, :status

has_one :model, :dependent => :destroy
has_one :photographer, :dependent => :destroy
has_one :modeling_agent, :dependent => :destroy
has_many :albums, :dependent => :destroy
has_many :album_images, :through => :albums

has_one :profile_pic, :dependent => :destroy
has_one :email_confirmation, :dependent => :destroy

has_many :relationships


validates :first_name, :presence => true
validates :last_name, :presence => true
validates :gender, :presence => true
validates :DOB, :presence => true
validates :role, :presence => true

accepts_nested_attributes_for :model
accepts_nested_attributes_for :photographer
accepts_nested_attributes_for :modeling_agent


def send_confirmation_email(id, email)

		@member = Member.find(id)
		
		confirmation_token = rand(36**20).to_s(36)

		#confirmation_token = @member.generate_token
	 	#if success: run email function to send email (pass in resource.email and confirmation token
		ConfirmationMailer.confirmation_email(email, confirmation_token).deliver
		unless @member.create_email_confirmation(:email => email, :confirmation_token => confirmation_token, :confirmation_sent => Time.now, :action => "new")
		 raise ActiveRecord::Rollback
		 end
		# end

end

end
