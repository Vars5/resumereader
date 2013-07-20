class UserMailer < ActionMailer::Base
  default from: "notifications@resquery.com"

  def signup_confirmation(user)
    @user = user
    
    mail to: user.email, subject: "Signup Confirmation- ResQuery", from: 'notifications@resquery.com'
  end

  def new_group(user)
    @user = user
    
    mail to: user.email, subject:"You have been invited to a group - ResQuery.", from: 'notifications@resquery.com'
  end

  def new_comment(users)
  
  end

end


