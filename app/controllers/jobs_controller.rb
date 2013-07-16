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
    @problem = Problem.new
    if params[:category_id]
      discipline = Category.find(params[:category_id])
      @jobs = Job.where("category_id = ?", discipline)
    else
      @jobs = Job.where('open = ?', true).order('due_date')
    end
  
  
  
  end
  
  def show
    @job = Job.find_by_id(params[:id])
    if user_signed_in?
      @appList = current_user.app_lists.build
    end


  end
  
  def edit
    @job = Job.find_by_id(params[:id])
  end
  
  def update
    @job = Job.find_by_id(params[:id])
    if @job.update_attributes(params[:jobs])
      #expire_fragment("job_opportunities")
      redirect_to @job
    end
  end
  
  def destroy
    @jobs = Job.find_by_id(params[:id]).destroy
    redirect_to root_path
  end
  


end
