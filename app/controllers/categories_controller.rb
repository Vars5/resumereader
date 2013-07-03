class CategoriesController < ApplicationController
  
  before_filter :authenticate_user!
  authorize_resource 
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
        redirect_to categories_index_path
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_index_path
    end
  end
    
  def index
    @categories = Category.all
  end
  
  def destroy
    @category = Category.find(params[:id]).destroy
  end
end
