class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.string :company
      t.string :role
      t.string :beggining_date
      t.string :end_date

      t.timestamps
    end
  end
end
