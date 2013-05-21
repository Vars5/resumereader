class PostsController < ApplicationController

  def create
    @post = @board.posts.build(params[:post])
    @post.user = current_user
    
    if @post.save
      redirect_to @post
    end
  
  end


end
