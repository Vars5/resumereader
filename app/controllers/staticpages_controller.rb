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
  
  
  
end
