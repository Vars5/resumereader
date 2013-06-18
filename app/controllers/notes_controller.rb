class NotesController < ApplicationController


  def create
    @note = Note.new(params[:note])
    if @note.save
      respond_to do |format|
        #format.html { redirect_to root_path }
        format.js
      end
    end
  end
  
  def update
    @note = Note.find_by_id(params[:note][:note_id])
    if @note.update_attributes(params[:note])
      redirect_to root_path
    end
  end
  
  
  def destroy
    @note = Note.find_by_id(params[:id]).destroy
    respond_to do |format|
      #format.html { redirect_to root_path }
      format.js
    end
    
  end

end
