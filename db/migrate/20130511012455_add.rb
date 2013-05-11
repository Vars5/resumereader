class Add < ActiveRecord::Migration
  def change
    add_column :responses, :responseable_type, :string
    add_index :responses, [:responseable_id, :responseable_type] 
  end
end
