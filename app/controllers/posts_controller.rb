class PostsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @board = Board.find_by_id(params[:post][:board_id])
    @post = @board.posts.build(params[:post])
    @post.user = current_user
    
    if @post.save
      redirect_to @board
    end
  
  end
  
  def destroy
    @post = Post.find_by_id(params[:id])
    @board = Board.find_by_id(@post.board_id)
    @postDelete = @post.delete
    redirect_to @board
  end


end
