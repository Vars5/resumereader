class BulletsController < ApplicationController
  
  before_filter :load_bulletable
  before_filter :authenticate_user!
  
  def index
    @bullets = @bulletable.bullets
  end

  def new
    @bullet = @bulletable.bullets.new
  end
  
  def create
    @bullet = @bulletable.bullets.new(params[:bullet])
    if @bullet.save
      redirect_to [@bulletable, :bullets], notice: "Bulletpoint created"
    else
      render "new"
    end
  end
  
  def update
    @bullet = Bullet.find_by_id(params[:id])
    if @bullet.update_attributes(params[:bullet])
      redirect_to [@bulletable, :bullets]
    end
  end
  
  def edit
    @bullet = Bullet.find(params[:id])
  end 
  
  private
  
    def load_bulletable
      resource, id = request.path.split('/')[1,2]
      @bulletable = resource.singularize.classify.constantize.find(id)
    end
  
end
