class AddKindToAppList < ActiveRecord::Migration
  def change
    add_column :app_lists, :kind, :string
    remove_column :app_lists, :type, :string
  end

end
