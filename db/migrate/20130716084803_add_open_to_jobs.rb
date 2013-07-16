class AddOpenToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :open, :boolean, default: true
  end
end
