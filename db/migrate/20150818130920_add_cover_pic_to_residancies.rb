class AddCoverPicToResidancies < ActiveRecord::Migration
  def up
    add_attachment :residancies, :cover_pic
  end

  def down
    remove_attachment :residancies, :cover_pic
  end
end
