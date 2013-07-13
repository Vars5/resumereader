class FollowsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    @company = Company.find(params[:follow][:company_id])
    current_user.follow!(@company)  
    respond_to do |format|
       format.html { redirect_to @company }
       format.js
    end
  end
  
  def destroy
    @follows = Follow.find_by_id(params[:id]).destroy
    
    #current_user.follows.find_by_company_id(params[:id]).destroy
    #current_user.follows.find_by_company_id(@company.id).destroy
    #current_user.unfollow!(@company)
    respond_to do |format|
       format.html { redirect_to @company }
       format.js
    end
  end

end
