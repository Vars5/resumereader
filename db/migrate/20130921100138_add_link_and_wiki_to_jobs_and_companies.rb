class AddLinkAndWikiToJobsAndCompanies < ActiveRecord::Migration
  def change
    add_column :jobs, :wiki,  :text
    add_column :jobs, :forum_link,  :text    
    add_column :companies, :wiki,  :text
  end
end
