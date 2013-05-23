class CreateAppLists < ActiveRecord::Migration
  def change
    create_table :app_lists do |t|

      t.integer :job_id
      t.integer :user_id
      t.string  :status
      t.text    :comments
      
      t.timestamps
    end
  end
end
