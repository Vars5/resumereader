class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.boolean :private, default: true

      t.timestamps
    end
  end
end
