class AddFieldsToArticle < ActiveRecord::Migration
  def change
  	add_column :articles,:author,:string
  	add_column :articles,:title,:string
  	add_column :articles,:description,:string
  	add_column :articles,:newsletter_id,:integer
  	add_attachment :articles, :avatar
  end
end
