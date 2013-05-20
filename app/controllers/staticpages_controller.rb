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
  
  
end
