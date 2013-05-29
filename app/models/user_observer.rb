class UserObserver < ActiveRecord::Observer 
  
  def after_create(user)
    UserMailer.signup_confirmation(user).deliver
  end  

end