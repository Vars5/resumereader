class UserObserver < ActiveRecord::Observer 
  
    def after_create(user)
      if user.sign_in_count > 0
        UserMailer.signup_confirmation(user).deliver
      end
    end  
  
end