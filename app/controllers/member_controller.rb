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
      redirect_to @album
    else
      render :action => 'new_album'
    end
  end

	def edit_album
	  @album = Album.find(params[:id])
	end

 	def update_album
	  @member = Member.find(current_member.id)
    @album = @member.albums.build(params[:album])
    if @album.save
      flash[:notice] = "Successfully created album."
      redirect_to @album
    else
      render :action => 'new_album'
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
		
		attributes.each do |attribute|
			unless @album.album_images.create(attribute)
				flash.now[:notice] = "There was an error encountered."
				render :action => 'add_images'
			end
		end
	
	 flash[:notice] = "Successfully updated album."

	 redirect_to :action => 'show_album', :id => params[:id]

 	end


 def show_album
		@album_images = AlbumImage.where( 'album_id == ?', params[:id] )
 end


end
