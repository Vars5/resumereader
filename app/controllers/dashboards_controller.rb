class DashboardsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def dashboard
    @appListCount = current_user.app_list_count
    @appList = current_user.app_lists.find(:all, :joins => :job, :order => "due_date DESC")
    
    
    if (current_user.has_no_applists? || @appListCount < 6 )
      @company = Company.paginate(page: params[:page],:per_page => 5)
      @jobs = Job.paginate(page: params[:page],:per_page => 5)
    end
  end
  
  
  def add_quick_follow_list
    current_user.quick_follow_list
    redirect_to root_path
  end
  
  
  def follow
      @feed = current_user.companies.all
  end
  
  def graduate 
    
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
    @list = User.order('created_at')
    @job = Job.order('due_date')
    @company = Company.all
    authorize! :create, @job      
  end

  def my_jobs
    @appListCount = current_user.app_list_count
    @appList = current_user.app_lists.find(:all, :joins => :job, :order => :due_date)
    
    if (current_user.has_no_applists? || @appListCount < 6 )
      @company = Company.paginate(page: params[:page],:per_page => 5)
      @jobs = Job.paginate(page: params[:page],:per_page => 5)
    end
  end

end
