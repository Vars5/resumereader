class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :mobile_number, :string
  end
end
