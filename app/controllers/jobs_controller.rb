class JobsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  authorize_resource :except => [:index, :show]
  
  def create
    @company = Company.find_by_id(params[:jobs][:id])
    @job = @company.jobs.build(params[:jobs])
    if @job.save
      expire_fragment("job_opportunities")
      redirect_to @company
    end
  
  end
  
  def index
    @jobs = Job.search(params[:search]).order('due_date')
    @problem = Problem.new
  end
  
  def show
    @job = Job.find_by_id(params[:id])
    if user_signed_in?
      @appList = current_user.app_lists.build
    end


  end
  
  def edit
    @jobs = Job.find_by_id(params[:id])
  end
  
  def update
    @jobs = Job.find_by_id(params[:id])
    if @jobs.update_attributes(params[:jobs])
      expire_fragment("job_opportunities")
      redirect_to @jobs
    end
  end
  
  def destroy
    @jobs = Job.find_by_id(params[:id]).destroy
    redirect_to root_path
  end
  


end
