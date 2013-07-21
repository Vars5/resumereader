class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
