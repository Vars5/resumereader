class AddAttachmentDocumentToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.has_attached_file :document
    end
  end

  def self.down
    drop_attached_file :documents, :document
  end
end
