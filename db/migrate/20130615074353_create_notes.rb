class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :info
      t.string :title
      t.string :type
      t.integer :user_id
      t.integer :app_list_id

      t.timestamps
    end
  end
end
