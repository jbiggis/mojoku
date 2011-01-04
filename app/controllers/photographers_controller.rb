class PhotographersController < ApplicationController
  def index
    @photographers = Photographer.all
  end

  def show
    @photographer = Photographer.find(params[:id])
  end

  def new
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.new(params[:photographer])
    if @photographer.save
      flash[:notice] = "Successfully created photographer."
      redirect_to @photographer
    else
      render :action => 'new'
    end
  end

  def edit
    @photographer = Photographer.find(params[:id])
  end

  def update
    @photographer = Photographer.find(params[:id])
    if @photographer.update_attributes(params[:photographer])
      flash[:notice] = "Successfully updated photographer."
      redirect_to @photographer
    else
      render :action => 'edit'
    end
  end

  def destroy
    @photographer = Photographer.find(params[:id])
    @photographer.destroy
    flash[:notice] = "Successfully destroyed photographer."
    redirect_to photographers_url
  end
end
