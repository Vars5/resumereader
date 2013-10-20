class AddUserIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :user_id, :integer
    add_column :questions, :company_id, :integer
    add_column :questions, :category_id, :integer
  end
end
