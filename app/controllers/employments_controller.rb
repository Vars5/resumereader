class EmploymentsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def new
    @employment = current_user.employments.build
  end
  
  def create
    @employment = current_user.employments.build(params[:employment])
    if @employment.save
      flash[:success] = "Successfully created an employment field for you"
      redirect_to resume_path
    else
      flash[:alert] = "Something went wrong on our end in trying to create this, apologies!"
      render 'new'
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
      flash[:success] = "Your employment details were sucessfully updated"
      redirect_to resume_path
    else
      render resume_path
    end

  end

  def destroy
    @employment = current_user.employments.find_by_id(params[:id]).destroy
    flash[:success] = "Your employment details were sucessfully deleted"
    redirect_to resume_path
  end


end
