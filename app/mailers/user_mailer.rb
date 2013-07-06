class UserMailer < ActionMailer::Base
  default from: "notifications@resquery.com"

  def signup_confirmation(user)
    @user = user
    
    mail to: user.email, subject: "Signup Confirmation- ResumeQuery", from: 'notifications@resquery.com'
  end
end
