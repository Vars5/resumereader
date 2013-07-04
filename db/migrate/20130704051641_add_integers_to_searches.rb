class AddIntegersToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :role_id, :integer
    add_column :searches, :category_id, :integer
    end
end
