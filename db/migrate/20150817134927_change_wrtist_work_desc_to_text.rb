class ChangeWrtistWorkDescToText < ActiveRecord::Migration
  def change
  	change_column :artists , :work_desc, :text
  end
end
