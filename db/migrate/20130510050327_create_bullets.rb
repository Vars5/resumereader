class CreateBullets < ActiveRecord::Migration
  def change
    create_table :bullets do |t|
      t.text :bulletpoint
      t.belongs_to :bulletable, polymorphic: true
      
      t.timestamps
    end
    add_index :bullets, [:bulletable_id, :bulletable_type]
  end
end
