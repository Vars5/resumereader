class DashboardsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def dashboard
    #For some reason, without the if statement
    #the build_setting function clears the database
    #The if statement is a dodgy current fix
    #@loadSetting = current_user.setting
    #if @loadSetting == nil
    #  @goal = current_user.build_setting
    #end
    #@loadGoal = current_user.setting.goal

    #New Problem Form
    @problem = Problem.new
   
    #AppList Feed
    @appListCount = current_user.app_list_count
    @appList = current_user.app_list_feed
    
    #All Jobs List
    @jobs = Job.order('due_date')
    
    #All Companies List
    @companies = Company.all
    
  end

  def resume
    authorize! :create, @job
    @user                 = current_user
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
  
  def changeSettings
    @settings = current_user.setting
  end
  
  def admin
    @list = User.all
    authorize! :create, @job
  end

end
