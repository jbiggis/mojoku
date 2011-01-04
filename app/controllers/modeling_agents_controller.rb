class ModelingAgentsController < ApplicationController
  def index
    @modeling_agents = ModelingAgent.all
  end

  def show
    @modeling_agent = ModelingAgent.find(params[:id])
  end

  def new
    @modeling_agent = ModelingAgent.new
  end

  def create
    @modeling_agent = ModelingAgent.new(params[:modeling_agent])
    if @modeling_agent.save
      flash[:notice] = "Successfully created modeling agent."
      redirect_to @modeling_agent
    else
      render :action => 'new'
    end
  end

  def edit
    @modeling_agent = ModelingAgent.find(params[:id])
  end

  def update
    @modeling_agent = ModelingAgent.find(params[:id])
    if @modeling_agent.update_attributes(params[:modeling_agent])
      flash[:notice] = "Successfully updated modeling agent."
      redirect_to @modeling_agent
    else
      render :action => 'edit'
    end
  end

  def destroy
    @modeling_agent = ModelingAgent.find(params[:id])
    @modeling_agent.destroy
    flash[:notice] = "Successfully destroyed modeling agent."
    redirect_to modeling_agents_url
  end
end
