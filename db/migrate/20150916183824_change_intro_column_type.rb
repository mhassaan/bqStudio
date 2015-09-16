class ChangeIntroColumnType < ActiveRecord::Migration
  def change
  	change_column :articles,:intro,:text
  	change_column :workshops,:intro,:text
  	change_column :visits,:intro,:text
  	change_column :residancies,:intro,:text
  	change_column :artists,:intro,:text
  end
end
