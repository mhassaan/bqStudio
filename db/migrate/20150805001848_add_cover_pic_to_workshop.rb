class AddCoverPicToWorkshop < ActiveRecord::Migration
  def up
    add_attachment :workshops, :cover_pic
  end

  def down
    remove_attachment :workshops, :cover_pic
  end
end
