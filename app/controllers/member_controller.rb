class MemberController < ApplicationController
  
  layout "member"
	
  def home

	  
  end

  def fb_signin
	if @member = Member.find_by_fb_id(params[:fb_id])
		sign_in_and_redirect(:member, @member)
	elsif @member = Member.find_by_email(params[:email])
		@member.update_attributes(:fb_id => params[:fb_id])
		sign_in_and_redirect(:member, @member)
	else
		@member = Member.create!(:fb_id => params[:fb_id], :email => params[:email], :first_name => params[:first_name], :last_name => params[:last_name], :gender => params[:gender], :DOB => params[:dob], :status => 3)
		sign_in_and_redirect(:member, @member)
	end
  end



  def profile
 		@member = Member.find(current_member.id)


  end

  def edit_profile_pic
	  @member = Member.find(current_member.id)
	@profile_pics = @member.profile_pics
		if @profile_pics.empty?
			@member.profile_pics.build
		end
     render :layout => "member_profile"
  end

	def update_profile_pic

	@member = Member.find(current_member.id)

#	if @member.profile_pics

#		unless @member.profile_pics.update_attributes(params[:member][:profile_pic], :status => 1)
#			flash.now[:notice] = "There was an error encountered."
#			render :action => 'edit_profile_pic'
#			return
#		end
#	else
	if @member.verification_pics.find(:last, :conditions => ['status = 1 or status = 2' ] )

		unless @member.profile_pics.create(params[:member][:profile_pic])
			flash.now[:notice] = "There was an error encountered."
			render :action => 'edit_profile_pic'
			return
		end
	
		if pic = @member.profile_pics.find(:first, :conditions => 'status = 3')
			pic.update_attributes(:status => 5)

		end
			#	end
	else	
		if pic = ProfilePic.find(:last, :conditions => 'status = 1' )
			pic.update_attributes(:status => 4)	
		end
		unless @member.profile_pics.create(params[:member][:profile_pic])
			flash.now[:notice] = "There was an error encountered."
			render :action => 'edit_profile_pic'
			return
		end
	end	
	
	
	
       	flash[:notice] = "Successfully updated profile picture."

	 redirect_to :action => 'profile', :id => current_member.id

	end

	  def cancel_verification
#	current_member.profile_pics.find(:last, :conditions => 'status = 1').update_attributes(:status => 5)
#	if current_member
		current_member.verification_pics.find(:last, :conditions => 'status = 1').update_attributes(:status => 4)
#	end
	redirect_to(member_edit_profile_pic_path)
  end


	def remove_profile_pic
	
	ProfilePic.find(:last, :conditions => ['status = 1 or status = 2'] ).update_attributes(:status => 6)
			redirect_to(member_edit_profile_pic_path)
	end
  def edit_email
  	@member = Member.find(current_member.id)
    	render :layout => "member_profile"
  end

  def send_confirmation


	confirmation_token = rand(36**20).to_s(36) #generate token

	unless current_member.create_email_confirmation(:email => params[:member][:email], :confirmation_token => confirmation_token, :confirmation_sent => Time.now, :action => "change")
		 raise ActiveRecord::Rollback
	end
	
	ConfirmationMailer.confirmation_email(params[:member][:email], confirmation_token).deliver
	flash[:notice] = "A confirmation has been sent to your new email, Please check your junk folder if you don't see it in your inbox."
redirect_to :action =>'edit_email'

  end

  def resend_confirmation


	

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

  def cancel_confirmation_request

	current_member.email_confirmation.destroy
	flash[:notice] = "Your email change request has been cancelled."
	redirect_to :action =>'edit_email'
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
		redirect_to :action => 'home'

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
		@albums = Album.where('member_id == ?',current_member.id)
  end

	def new_album
	  @member = Member.find(current_member.id)
	  @album = @member.albums.build
	end

  def create_album
	  @member = Member.find(current_member.id)
    @album = @member.albums.build(params[:album])
    if @album.save
      flash[:notice] = "Successfully created album."
      redirect_to :action => 'add_images', :id => @album.id
    else
      render :action => 'new_album'
    end
  end

	def edit_album_info
	  @album = Album.find(params[:id])
	end

 	def update_album_info
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
#	    @album.album_images.create(params[:album][:album_images])
      flash[:notice] = "Successfully updated album."
      redirect_to :action => 'show_album', :id => params[:id]
    else
      render :action => 'edit'
    end
  end


  def add_images
		@tempalbumid = params[:id]
	  @album = Album.new
	 	5.times{ @album.album_images.build}
	end

 	def save_images
 		@album = Album.find(params[:id])
		attributes = params[:album][:album_images_attributes]
		
		## to check if a cover image exists
		#hasCover = !@album.cover_id.nil?
		hasCover = @album.cover_id != 0
	 
		attributes.each do |attribute|

		
			## if a cover image already exists, just update the images
			unless album_image = @album.album_images.create(attribute)
				flash.now[:error] = "There was an error encountered."
				render :action => 'add_images'
				return
			end


			## Defaults the first image in an album to be the cover image
			if !hasCover
				## Updates the cover columns
				Member.transaction do
					@album_image = AlbumImage.find(album_image[1][:id])
					@album_image.update_attributes(:cover => true)

					@album2 = Album.find(params[:id])
					@album2.cover_id = @album_image.id 
					unless @album2.save
						raise ActiveRecord::Rollback
					end
				end
				hasCover = true
				
			end
			###
			
		end

	 flash[:notice] = "Successfully updated album."

	 redirect_to :action => 'show_album', :id => params[:id]

 	end


	def edit_images
		@album = Album.find(params[:id])
		@album_images = AlbumImage.where("album_id == ?", params[:id])
	end

	def update_images
		@album = Album.find(params[:id])

		## update album cover if cover id is changed
		if @album.cover_id != Integer(params[:cover])
			Member.transaction do
				@album_image = AlbumImage.find(String(@album.cover_id))
				@album_image.update_attributes(:cover => false)
				@album_image = AlbumImage.find(params[:cover])
				unless @album_image.update_attributes(:cover => true)
					raise ActiveRecord::Rollback
					flash[:error]="Cannot chance cover image!"
				end 
				@album.cover_id = params[:cover]
				unless @album.save 
					raise ActiveRecord::Rollback
					flash[:error]="Cannot change cover image!"
				end
			end
		end
		## end update album cover
		
		attributes = params[:album][:album_images_attributes]

		attributes.each do |attribute|

			@album_image = AlbumImage.find(attribute[1][:id])
			unless @album_image.update_attributes(attribute[1])
				flash.now[:notice] = "There was an error encountered."
 				render :action => 'edit_images'
				return
    	end
		
		end	
			#flash[:notice] = "Successfully updated album."
      redirect_to :action => 'show_album', :id => params[:id]
		

	end

 def show_album
@album = Album.find(params[:id])	
 	 @album_images = AlbumImage.where( 'album_id == ?', params[:id] )
 end

 def show_album_image
	@album_image = AlbumImage.find(params[:id])
 end

 def show_relationships

	 @followers = Relationship.where('member_id == ?', current_member.id)

	 @followings = Relationship.where('follower_id == ?', current_member.id)
 end
end
