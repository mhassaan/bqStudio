class AddFieldsToResidancy < ActiveRecord::Migration
  def change
  	add_column :residancies,:name,:string
  	add_column :residancies,:desc,:text
  	add_column :residancies,:location,:string
  end
end
