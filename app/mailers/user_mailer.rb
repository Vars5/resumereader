class UserMailer < ActionMailer::Base
  default from: "from@example.com"


  def signup_confirmation(user)
    @user = user
    @greeting = "Hi"

    mail to: user.email, subject: "Signup Confirmation- ResumeQuery"
  end
end
