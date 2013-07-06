class DashboardsController < ApplicationController
  
  before_filter :authenticate_user!


  #temporary fix for raw javascript showing up when 'back' is pressed on the dashboard
  #move towards ember if possible
  after_filter do 
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
  def dashboard

    #AppList Feed
    @appListCount = current_user.app_list_count
    @appList = current_user.app_list_feed
    
    #All Jobs List
    @jobs = Job.paginate(page: params[:page],:per_page => 5)
    
    #All Companies List
    @companies = Company.all
    
  end

  #def resume
  # authorize! :create, @job
  # @user                 = current_user
  # @schoolAll            = current_user.schools
  # @schoolCount          = current_user.schools.count
  # @employmentAll        = current_user.employments
  # @employmentCount      = current_user.employments.count
  # @extracurricularAll   = current_user.extracurriculars
  # @extracurricularCount = current_user.extracurriculars.count
  # @bulletpointsAll      = Bullet.where(bulletable_id = "1", bulletable_type = "employment").all 
  #end
  
  
  #def resumeQuestions
  #end
  
  #def changeSettings
  #  @settings = current_user.setting
  #end
  
  def admin
    @list = User.all
    authorize! :create, @job      
  end


end
