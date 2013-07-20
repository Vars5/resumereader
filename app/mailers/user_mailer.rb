class UserMailer < ActionMailer::Base
  default from: "notifications@resquery.com"

  def signup_confirmation(user)
    @user = user
    
    mail to: user.email, subject: "Signup Confirmation- ResQuery", from: 'notifications@resquery.com'
  end

  def new_group(user, current_user, group)
    @user = user
    @current_user = current_user
    
    mail to: user.email, 
    subject:"#{current_user.first_name} invited you to #{group.name}  - ResQuery",
    from: current_user.first_name
  end

  def new_comment(users)
  
  end

end


