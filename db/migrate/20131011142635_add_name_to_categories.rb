class AddNameToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :name, :string
    add_column :categories, :category, :string
  end
end
