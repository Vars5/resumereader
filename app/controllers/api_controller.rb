class ApiController < RocketPants::Base

  def index
    
    allComments = Comment.last(6).reverse

    allComments.each do |comment|
      #note, for api, we currently use 'subject' to load the company's name
      #set it so we can show the companies name on the phone
      comment.title = "#{comment.get_company_for_comment.name} - #{Category.find(comment.category_id).name}"
    end
    expose allComments
  end
  
  def show
    expose Comment.find(params[:id])
  end

end