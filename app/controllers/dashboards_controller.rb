class DashboardsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def dashboard
   @user = current_user
  end

  def resume
    @schoolAll            = current_user.schools
    @schoolCount          = current_user.schools.count
    @employmentAll        = current_user.employments
    @employmentCount      = current_user.employments.count
    @extracurricularAll   = current_user.extracurriculars
    @extracurricularCount = current_user.extracurriculars.count
    #@bulletpointsAll      = Bullet.where(bulletable_id = "1", bulletable_type = "employment").all 
  end
  
  
  def resumeQuestions
  end

end
