class AddCoverPicToVisit < ActiveRecord::Migration
  def up
    add_attachment :visits, :cover_pic
  end

  def down
    remove_attachment :visits, :cover_pic
  end
end
