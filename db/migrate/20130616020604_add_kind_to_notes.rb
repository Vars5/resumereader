class AddKindToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :kind, :string    
    Note.update_all ["kind = ?", "comment"]
  end
  
end
