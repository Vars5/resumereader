class StaticpagesController < ApplicationController
  def home
  end

  def about
  end
  
  def structure
  end
  
  def resumeQuestions
  end
  
  def feedback
  end
  
  def structure
    @user = current_user.schools.build
    @employment = current_user.employments.build
  end
  
  def dashboard
    @schoolAll            = current_user.schools
    @schoolCount          = current_user.schools.count
    @employmentAll        = current_user.employments
    @employmentCount      = current_user.employments.count
    @extracurricularAll   = current_user.extracurriculars
    @extracurricularCount = current_user.extracurriculars.count
  end
  
end
