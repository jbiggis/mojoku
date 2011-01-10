class AlbumImagesController < ApplicationController
  def index
    @album_images = AlbumImage.all
  end

  def show
    @album_image = AlbumImage.find(params[:id])
  end

  def new
    @album_image = AlbumImage.new
  end

  def create
    @album_image = AlbumImage.new(params[:album_image])
    if @album_image.save
      flash[:notice] = "Successfully created album image."
      redirect_to @album_image
    else
      render :action => 'new'
    end
  end

  def edit
    @album_image = AlbumImage.find(params[:id])
  end

  def update
    @album_image = AlbumImage.find(params[:id])
    if @album_image.update_attributes(params[:album_image])
      flash[:notice] = "Successfully updated album image."
      redirect_to @album_image
    else
      render :action => 'edit'
    end
  end

  def destroy
    @album_image = AlbumImage.find(params[:id])
    @album_image.destroy
    flash[:notice] = "Successfully destroyed album image."
    redirect_to album_images_url
  end
end
