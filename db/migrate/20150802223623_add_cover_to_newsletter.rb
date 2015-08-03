class AddCoverToNewsletter < ActiveRecord::Migration
  def up
    add_attachment :newsletters, :cover_pic
  end

  def down
    remove_attachment :newsletters, :cover_pic
  end
end
