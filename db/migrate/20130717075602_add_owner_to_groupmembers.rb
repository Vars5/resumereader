class AddOwnerToGroupmembers < ActiveRecord::Migration
  def change
    add_column :groupmembers, :owner, :boolean, default: false
  end
end
