class FollowsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    @company = Company.find(params[:follow][:company_id])
    current_user.follow!(@company)  
    respond_to do |format|
       format.html { redirect_to companies_path }
#       format.js 
    end
  end
  
  def destroy
    @company = Follow.find_by_id(params[:id]).destroy
    
    respond_to do |format|
       format.html { redirect_to companies_path }
#       format.js
    end
  end

end
