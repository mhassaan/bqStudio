class AddFieldsToBanner < ActiveRecord::Migration
  def up
    add_attachment :banners, :avatar
  end

  def down
    remove_attachment :banners, :avatar
  end
end
