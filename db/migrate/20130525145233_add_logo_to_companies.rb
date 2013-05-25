class AddLogoToCompanies < ActiveRecord::Migration
  def self.up
    add_attachment :companies, :logo
  end
  
  def self.doan
    add_attachment :companies, :logo
  end
end
