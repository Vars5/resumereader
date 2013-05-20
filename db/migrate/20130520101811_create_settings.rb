class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :user_id
      t.text :goal
      t.string :forum_name

      t.timestamps
    end
  end
end
