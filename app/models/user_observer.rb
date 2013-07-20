class UserObserver < ActiveRecord::Observer 
  
    def after_create(user)
      if user.invitation_token.nil?
        UserMailer.signup_confirmation(user).deliver
      end
    end  
end