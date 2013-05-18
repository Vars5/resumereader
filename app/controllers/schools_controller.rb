class SchoolsController < ApplicationController

  before_filter :authenticate_user!
  
  def new
    @school=current_user.schools.build
  
  end
  
  def create
    @user=current_user.schools.build(params[:user])
    if @user.save
      redirect_to root_url
    else
      
    end
  end
  
  def show
    @user = current_user.schools.find_by_id(params[:id])
    if @user == nil
      @user = "You've Reached a page you don't have permission to"
    end
  end
  
  def edit
    @school = current_user.schools.find_by_id(params[:id])
    if @school == nil
      redirect_to root_path
      #change to an error page     
    end
      
  end
  
  def update
    @school=current_user.schools.find_by_id(params[:id])
    if @school.update_attributes(params[:school])
      flash[:success] = "School Updated"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  def destroy
    @user=current_user.schools.find_by_id(params[:id]).destroy
    redirect_to root_path
  end
  

end
