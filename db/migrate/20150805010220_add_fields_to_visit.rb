class AddFieldsToVisit < ActiveRecord::Migration
  def change
  	add_column :visits,:name,:string
  	add_column :visits,:desc,:string
  	add_column :visits,:location,:string
  end
end
