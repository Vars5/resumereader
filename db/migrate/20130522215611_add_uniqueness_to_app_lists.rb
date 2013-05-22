class AddUniquenessToAppLists < ActiveRecord::Migration
  def change
  
    add_index :app_lists, [:user_id, :job_id], unique: true
  end
end
