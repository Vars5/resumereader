class AddKindToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :kind, :string
    remove_column :notes, :type, :string    
    Note.update_all ["kind = ?", "comment"]
  end
  
end
