class AddFieldsToWorkshop < ActiveRecord::Migration
  def change
  	add_column :workshops,:name,:string
  	add_column :workshops,:desc,:string
  	add_column :workshops,:location,:string
  end
end
