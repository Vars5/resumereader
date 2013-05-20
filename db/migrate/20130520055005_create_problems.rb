class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.text :problem
      t.integer :reporter_id
      t.timestamps
    end
  end
end
