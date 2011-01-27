class PublicController < ApplicationController
  def home
 # warden.raw_session.inspect
  #      warden.logout

  end

  def list_members
	@members = Member.all
  end

  def albums
  	@albums = Album.all
  
  end

  def show_album
	@album = Album.find(params[:id])
	@album_images = AlbumImage.where( 'album_id == ?', params[:id] )
  end

  def add_to_collection
	current_member.collections.create!(:album_id => params[:id] )
	flash[:notice] = "Album has been added to your collection"
	#flash[:notice] = params[:id]
	redirect_to(root_url)  
	#redirect_to(public_show_album_path(params[:id]))
  end

  def like_album
  
	  @album = Album.find(params[:id])
	  likes=@album.likes
	  @album.update_attributes(:likes => likes + 1)
  
	  flash[:notice] = @album.inspect
	  redirect_to(root_url)
  end

 def unlike_album
  
	  @album = Album.find(params[:id])
	  likes=@album.likes
	  @album.update_attributes(:likes => likes - 1)
  
	  flash[:notice] = @album.inspect
	  redirect_to(root_url)
  end




  def member_home
	@member = Member.find(params[:id])
  end

  def member_profile
	@member = Member.find(params[:id])
  end

  def member_portfolio
	@member = Member.find(params[:id])
  end

  def fb_registration
  end

end
