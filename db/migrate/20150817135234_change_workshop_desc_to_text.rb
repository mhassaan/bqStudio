class ChangeWorkshopDescToText < ActiveRecord::Migration
  def change
  	change_column :workshops , :desc, :text
  end
end
