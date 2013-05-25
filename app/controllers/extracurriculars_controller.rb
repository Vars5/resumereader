class ExtracurricularsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @extracurricular = current_user.extracurriculars.build
  end
  
  def create
    @extracurricular = current_user.extracurriculars.build(params[:extracurricular])
    if @extracurricular.save
       flash[:success] = "Successfully created an extracurricular for you"
        redirect_to resume_path
    else
      flash[:alert] = "Something went wrong on our end in trying to create this, apologies!"
      render 'new'
    end
  end
  
  def edit
    @extracurricular = current_user.extracurriculars.find_by_id(params[:id])
    if @extracurricular == nil
      #change to error page once set up
      redirect_to root_path
    end
  end
  
  def update
    @extracurricular = current_user.extracurriculars.find_by_id(params[:id])
    if @extracurricular.update_attributes(params[:employment])
      redirect_to root_path
    else
      redirect_to root_path
    end
    
  end
  
  def destroy
    @extracurricular = current_user.extracurriculars.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

end
