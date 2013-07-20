class UserObserver < ActiveRecord::Observer 
  
    def after_create(user)
      if user.invited_by_id.nil?
        UserMailer.signup_confirmation(user).deliver
      end
    end  
end