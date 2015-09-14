class AddIntroFieldToArticles < ActiveRecord::Migration
  def change
  	add_column :articles,:intro,:string
  end
end
