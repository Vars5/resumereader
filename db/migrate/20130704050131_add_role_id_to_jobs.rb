class AddRoleIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :role_id, :integer
  end
end
