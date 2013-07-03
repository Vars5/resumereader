class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :role
      t.string :discipline
      t.string :location

      t.timestamps
    end
  end
end
