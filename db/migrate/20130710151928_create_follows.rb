class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
    
    add_index :follows, [:user_id, :company_id], unique: true
  end
end
