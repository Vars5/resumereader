class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      
      t.string  :name
      t.string  :link
      t.integer :company_id
      t.string  :discipline
      t.text    :info
      t.date    :due_date
      
      t.timestamps
    end
  end
end
