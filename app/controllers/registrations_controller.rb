class RegistrationsController < Devise::RegistrationsController
 
  def create
    build_resource
 
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        #return render :json => {:success => true}
        finished("SignUp")
        respond_to do |format|
          format.json {render :json => {:success => true}}
          format.html {redirect_to onboarding_path}
        end
        
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_to do |format|
          format.json {render :json => {:success => true}}
          format.html {redirect_to root_path}
        end
      end
    else
      clean_up_passwords resource
      return render :json => {:success => false}
    end
  end
 
 
 
  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end
 

end
