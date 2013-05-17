class EmploymentsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def new
    @employment = current_user.employments.build
  end
  
  def create
    @employment = current_user.employments.build(params[:employment])
    if @employment.save
      redirect_to root_path
    else
      redirect_to root_path
    end   
  end
  
  def edit
    @employment = current_user.employments.find_by_id(params[:id])
    if @employment == nil
      #change this to an error page once I make one
      redirect_to root_path
    end
  end
  
  def update
    @employment = current_user.employments.find_by_id(params[:id])
    if @employment.update_attributes(params[:employment])
      redirect_to root_path
    else
      render 'edit'
    end

  end

  def destroy
    @employment = current_user.employments.find_by_id(params[:id]).destroy
    redirect_to root_path
  end


end
