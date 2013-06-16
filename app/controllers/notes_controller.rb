class NotesController < ApplicationController


  def create
    @note = Note.new(params[:note])
    if @note.save
      redirect_to root_path
    end
  end
  
  def update
  end
  
  def destroy
  end

end
