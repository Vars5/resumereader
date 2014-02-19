class IndustriesController < ApplicationController

  before_filter :authenticate_user!

  
  def new
    @industry = Industry.new
  end

  def create
    @industry = Industry.new(params[:industry])
    if @industry.save
        redirect_to industries_index_path
    end
  end
  
  def edit
    @industry = Industry.find(params[:id])
  end
  
  def show
    @industry = Industry.find(params[:id])
    @industry_companies = Company.where(industry_id: params[:id])
  end
  
  def update
    @industry = Industry.find(params[:id])
    if @industry.update_attributes(params[:industry])
      redirect_to industries_index_path
    end
  end
    
  def index
    @industries = Industry.all
  end
  
  def industry_advice
    @industry_all = Industry.all
  end
  
end
