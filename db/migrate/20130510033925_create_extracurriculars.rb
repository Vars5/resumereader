class CreateExtracurriculars < ActiveRecord::Migration
  def change
    create_table :extracurriculars do |t|
      t.string :name
      t.string :role
      t.integer :user_id

      t.timestamps
    end
  end
end
