class UserMailer < ActionMailer::Base
  default from: "team@dempoints.com"

  def signup_confirmation(user)
    @user = user
    attachments.inline['DemPointsLogo.png'] = File.read(Rails.root.join('app/assets/images/DemPointsLogo.png'))
    mail to: user.email, subject: "Signup Confirmation - DemPoints", from: 'team@dempoints.com'
  end

  def new_group(user, current_user, group)
    @user = user
    @current_user = current_user
    
    mail to: user.email, 
    subject:"#{current_user.first_name} invited you to #{group.name}  - DemPoints",
    from: current_user.email
  end

  def new_comment(users)
  
  end
  
  #Note this is incomplete, only use as a guide when we rewrite this for production
  def weekly_digest(user)
    
    attachments.inline['whitelogo.png'] = File.read(Rails.root.join('app/assets/images/whitelogo.png'))
    
    @user = user
    @introduction = "Type an introduction here somehow"
    @first_item = "Comment.find(target.comment)"
    @second_item = "Comment.find(target.comment)"
    @third_item = "Comment.find(target.comment)"
    
  end
  

end


