class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :git
      t.string :add
      t.string :.

      t.timestamps
    end
  end
end
