class AddFieldToPicture < ActiveRecord::Migration
  def up
    add_attachment :pictures, :avatar
    add_column 		 :pictures ,:imageable_id,:integer
    add_column 		 :pictures ,:imageable_type,:string
    add_index      :pictures, :imageable_id
  end

  def down
    remove_attachment :pictures, :avatar
    remove_column 		 :pictures ,:imageable_id,:integer
    remove_column 		 :pictures ,:imageable_type,:string
  end
end
