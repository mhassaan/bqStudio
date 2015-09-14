class AddIntroFieldToNavs < ActiveRecord::Migration
  def change
  	add_column :visits,:intro,:string
  	add_column :artists,:intro,:string
  	add_column :workshops,:intro,:string
  	add_column :residancies,:intro,:string
  end
end
