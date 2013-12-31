class ApiController < RocketPants::Base

  def index
    
    allComments = Comment.all.reverse

    allComments.each do |commentitem|
      #note, for api, we currently use 'subject' to load the company's name
      #set it so we can show the companies name on the phone
      commentitem.title = commentitem.get_company_for_comment.name
    end
    expose allComments
  end
  
  def show
    expose Comment.find(params[:id])
  end

end