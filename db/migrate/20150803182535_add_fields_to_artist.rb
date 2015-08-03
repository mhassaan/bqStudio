class AddFieldsToArtist < ActiveRecord::Migration
  def change
  	add_column :artists,:name,:string
  	add_column :artists,:work_desc,:string
  end
end
