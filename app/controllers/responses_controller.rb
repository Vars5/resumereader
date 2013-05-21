class ResponsesController < ApplicationController
  
  before_filter :load_responseable
  
  
  def index
    @responses = @responseable.responses
  end

  def new
    @response = @responseable.responses.new
    @question = Question.all
  end
  
  def create
    @response = @responseable.responses.new(params[:response])
    if @response.save
      redirect_to [@responseable, :responses], notice: "Answer saved"
    else
      render "new"
    end
  end

  def edit
    @response = Response.find(params[:id])
  end
  

  
  private
  
    def load_responseable
      resource, id = request.path.split('/')[1,2]
      @responseable = resource.singularize.classify.constantize.find(id)
    end
  

end
