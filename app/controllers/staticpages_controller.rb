class StaticpagesController < ApplicationController
  
  caches_page :about
  
  def home
    @jobs = Job.order("due_date DESC")
  end

  def about
  end
  
  def structure
  end

  
  def feedback
  end
  
  def graduate_jobs
    @jobs = Job.where('type = ?', "Graduate Job").order('due_date')
  end
  
  
  
end
