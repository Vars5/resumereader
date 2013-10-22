class CreateQuestioncomments < ActiveRecord::Migration
  def change
    create_table :questioncomments do |t|
      t.integer :question_id
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
