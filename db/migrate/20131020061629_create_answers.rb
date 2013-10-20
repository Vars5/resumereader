class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
