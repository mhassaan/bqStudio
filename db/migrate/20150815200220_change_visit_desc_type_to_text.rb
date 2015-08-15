class ChangeVisitDescTypeToText < ActiveRecord::Migration
  def change
  	change_column :visits , :desc, :text
  end
end
