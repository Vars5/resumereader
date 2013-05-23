#The purpose of this controller is to 
#offload all of the non-login user settings 
#so that its easier to edit for the user
#(eg. edit first_name w.o using a password)
#So move first_name, last_name & contact # to this controller soon

class SettingsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @settings = current_user.build_setting(params[:settings])
    if @settings.save 
      redirect_to root_path
    end  
  end
  
  def edit
    @settings = current_user.setting
    if @settings == nil
      @message  = "You've Reached a page you don't have permission to"
    end
  end
  
  def update
    @settings = current_user.setting
    if @settings.update_attributes(params[:settings])
      redirect_to root_path
    end
  end

end
