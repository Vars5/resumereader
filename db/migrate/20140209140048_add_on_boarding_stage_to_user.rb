class AddOnBoardingStageToUser < ActiveRecord::Migration
  def change
    add_column :users, :onboarding_stage, :integer
  end
end
