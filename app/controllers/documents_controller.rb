class DocumentsController < ApplicationController
  
  before_filter :authenticate_user!
  
  
  def new
    @group = Group.find(params[:group_id])
    @document = Document.new
  end

  def create
   @group = Group.find(params[:group_id])
   @document = @group.documents.build(params[:document])
    if @document.save
      redirect_to [@group, @document]
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:group_id])
    @document = @group.documents.find(params[:id])
    @comments = @document.comment_threads.order('created_at asc')
    @new_comment = Comment.build_from(@document, current_user, "")
  end

  def edit
  end
  
  def destroy
  end

  def index
    @group = Group.find(params[:group_id])
    @documents = @group.documents.all
  end
  
  def destroy
  end
  
end
