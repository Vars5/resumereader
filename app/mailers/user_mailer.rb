class UserMailer < ActionMailer::Base
  default from: "team@dempoints.com"

  def signup_confirmation(user)
    @user = user
    
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

end


