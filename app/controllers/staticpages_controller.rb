class StaticpagesController < ApplicationController
  
  caches_page :about
  
  def home
    @comments = Comment.order("RANDOM()")
  end

  def about
  end
  
  def structure
  end

  
  def feedback
  end
  
  def graduate_jobs
    @jobs = Job.where('job_type = ?', "Graduate Job").order("due_date DESC")
  end
  
  def internships
    @jobs = Job.where('job_type = ?', "Internship").order("due_date DESC")
  end
  
  
  
end
