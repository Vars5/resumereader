class AddTaglineToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :tagline, :text
  end
end
