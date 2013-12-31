class StaticpagesController < ApplicationController
  
  caches_page :about
  
  def home
    @comments = Comment.find(:all, :order => "id desc", :limit => 15);
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
  
  def invite
  end
  
  def invitable
    @invite_hash = params[:invite]
    @user = User.find_by_email(@invite_hash[:email])
    if @user.blank?
      User.invite!({:email => @invite_hash[:email]}, current_user)
      redirect_to root_path
      current_user.update_attributes(:access => "true")
    else
      #display message 
    end
  end
  
  def api
  end
    
  
end
