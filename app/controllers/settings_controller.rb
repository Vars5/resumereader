class SettingsController < ApplicationController

  def create
    @settings = current_user.create_setting(params[:settings])
  
  end

end
