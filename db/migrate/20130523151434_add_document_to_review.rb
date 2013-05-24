class AddDocumentToReview < ActiveRecord::Migration
  def self.up
    add_attachment :reviews, :document
  end
  
  def self.down
    remove_attachment :reviews, :document
  end  
  
end
