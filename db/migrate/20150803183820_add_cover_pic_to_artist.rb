class AddCoverPicToArtist < ActiveRecord::Migration
  def up
    add_attachment :artists, :cover_pic
  end

  def down
    remove_attachment :artists, :cover_pic
  end
end
