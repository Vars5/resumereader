class SchoolsController < ApplicationController

  def create
    @user=current_user.schools.build(params[:user])
    if @user.save
      redirect_to root_url
    else

    end
  end

end
