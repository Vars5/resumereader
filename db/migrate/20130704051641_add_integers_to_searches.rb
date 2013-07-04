class AddIntegersToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :role_id, :integer
    add_column :searches, :category_id, :integer
    remove_column :searches, :discipline, :string
    remove_column :searches, :role, :string
  end
end
