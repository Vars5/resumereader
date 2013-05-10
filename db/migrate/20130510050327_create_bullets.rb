class CreateBullets < ActiveRecord::Migration
  def change
    create_table :bullets do |t|

      t.timestamps
    end
  end
end
