class CompaniesController < ApplicationController

  before_filter :authenticate_user!
  authorize_resource :except => [:index, :show]
  
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      flash[:success] = "You have successfully created a new company"
      expire_fragment("companies_list")
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong when trying to create this company"
      render 'new'
    end
  end
  
  def show
    @company = Company.find_by_id(params[:id])
    @jobs = @company.jobs.build
    @boards = @company.boards.new
    @allBoards = Board.where("company_id = ?", params[:id])
    @problem = Problem.new
  end
  
  def index
    @allCompanies = Company.paginate(page: params[:page],:per_page => 10)
  
  end
  
  def edit
    @company = Company.find_by_id(params[:id])
  end
  
  def update 
    @company = Company.find_by_id(params[:id])
    if @company.update_attributes(params[:company])
      flash[:success] = "Successfully updated the company"
      expire_fragment("companies_list")
      redirect_to @company 
    else
      flash[:alert] = "Something went wrong when trying to update this company"
      redirect_to @company
    end
    
  end
  
  def destroy
    @company = Company.find(params[:id]).destroy
    flash[:success] = "Successfully destroyed the company"
    redirect_to root_path
  end

end
