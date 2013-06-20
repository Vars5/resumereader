class UserObserver < ActiveRecord::Observer 
  if Rails.env.production?
    def after_create(user)
      UserMailer.signup_confirmation(user).deliver
    end  
  end
end