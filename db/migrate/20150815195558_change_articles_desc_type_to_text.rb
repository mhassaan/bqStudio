class ChangeArticlesDescTypeToText < ActiveRecord::Migration
  def change
  	change_column :articles , :description, :text
  end
end
