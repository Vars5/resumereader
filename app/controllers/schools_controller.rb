class SchoolsController < ApplicationController

  def create
    @user=current_user.schools.build(params[:user])
    if @user.save
      redirect_to root_url
    else

    end
  end
  
  def show
    
  end
  
  def edit
    @user=current_user.schools.find_by_id(params[:id])
  end
  
  def update
    @user=current_user.schools.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "School Updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @user=current_user.schools.find_by_id(params[:id]).destroy
    redirect_to root_path
  end
  

end
