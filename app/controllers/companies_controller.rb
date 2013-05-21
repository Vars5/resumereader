class CompaniesController < ApplicationController

  before_filter :authenticate_user!

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to root_path
    end
  end
  
  def show
    @company = Company.find_by_id(params[:id])
    @info = @company.info
    @jobs = @company.jobs.build
    @companyJobs = @company.jobs
    @boards = @company.boards.new
  end
  
  def index
    @allCompanies = Company.all
  
  end
  
  def edit
    @company = Company.find_by_id(params[:id])
  end
  
  def update 
    @company = Company.find_by_id(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to @company 
    end
    
  end
  
  def destroy
    @company = Company.find(params[:id]).destroy
    redirect_to root_path
  end

end
