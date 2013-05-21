class AddCompanyIdToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :company_id, :integer
  end
end
