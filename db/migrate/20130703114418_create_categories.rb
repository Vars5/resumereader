class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :discipline

      t.timestamps
    end
  end
end
