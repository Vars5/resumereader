class QuestionsController < ApplicationController
  
  #authorize_resource :except => [:index, :show]
  #check if this is nested? im not sure how polymorphic works with cancan
  
  before_filter :authenticate_user!
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to @question
    end
  end

  def show
    @question = Question.find(params[:id])
    @new_comment = Comment.build_from(@question, current_user, "", "", "")
    @answers = @question.comments.all
  end

  def index
    @question = Question.all
  end
  
end
