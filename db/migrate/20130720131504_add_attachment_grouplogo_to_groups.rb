class AddAttachmentGrouplogoToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.has_attached_file :grouplogo
    end
  end

  def self.down
    drop_attached_file :groups, :grouplogo
  end
end
