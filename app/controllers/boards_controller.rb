class BoardsController < ApplicationController

  
  def create
    @company = Company.find_by_id(params[:boards][:company_id])
    @board = @company.boards.new(params[:boards]) 
    if @board.save
      redirect_to @company
    end
  end

  def show
    @board = Board.find_by_id(params[:id])
    @post  = @board.posts.build
    #reverse for chronologically new post
    @showPosts = Post.where("board_id = ?", (params[:id])).reverse
  end
  
  def edit
    @board = Board.find_by_id(params[:id])
  end
  
  def update
    @board = Board.find_by_id(params[:id])
    if @board.update_attributes(params[:boards])
      redirect_to @board
    end
  end
  
  def destroy
    @board = Board.find_by_id(params[:id])
  end
  
  


end
