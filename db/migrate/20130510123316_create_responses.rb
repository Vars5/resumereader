class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :answer
      t.belongs_to :responseable, poylmorphic: true

      t.timestamps
    end
    
  end
end
