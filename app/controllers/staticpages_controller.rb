class StaticpagesController < ApplicationController
  
  caches_page :about
  
  def home
    @jobs = Job.all
  end

  def about
  end
  
  def structure
  end

  
  def feedback
  end
  
  
  
end
