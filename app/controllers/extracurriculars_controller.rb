class ExtracurricularsController < ApplicationController

  def new
    @extracurricular = current_user.extracurriculars.build
  end
  
  def create
    @extracurricular = current_user.extracurriculars.build(params[:extracurricular])
    if @extracurricular.save
      redirect_to root_path
    else 
      redirect_to root_path
    end
  end
  
  def edit
    @extracurricular = current_user.extracurriculars.find_by_id(params[:id])
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
