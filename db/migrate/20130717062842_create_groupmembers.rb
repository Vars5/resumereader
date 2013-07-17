class CreateGroupmembers < ActiveRecord::Migration
  def change
    create_table :groupmembers do |t|
      t.integer :group_id
      t.integer :user_id
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
