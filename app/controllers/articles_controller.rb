class ArticlesController < ApplicationController
  
    before_filter :authenticate_user!, except: [:index, :show]
    authorize_resource :except => [:index, :show]
    
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
    else
      render'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end
end
