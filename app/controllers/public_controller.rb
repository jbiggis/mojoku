class PublicController < ApplicationController
  def home
  end

  def list_members
	@members = Member.all
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

  
end
