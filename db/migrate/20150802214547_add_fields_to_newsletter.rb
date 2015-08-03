class AddFieldsToNewsletter < ActiveRecord::Migration
  def change
    add_column :newsletters,:title,:string
    add_column :newsletters,:summary,:string
    add_column :newsletters , :publisher_date , :date
  end
end
