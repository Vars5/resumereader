class ApiController < RocketPants::Base

  def index
    expose Comment.all
  end
  
  def show
    expose Comment.find(params[:id])
  end

end