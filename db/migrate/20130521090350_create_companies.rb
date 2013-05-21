class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|

      t.string :name
      t.string :industry
      t.string :website
      t.string :hr_email
      
      t.text :info


      t.timestamps
    end
  end
end
