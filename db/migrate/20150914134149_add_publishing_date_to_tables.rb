class AddPublishingDateToTables < ActiveRecord::Migration
  def change
    add_column :visits,:publishing_date,:date
    add_column :artists,:publishing_date,:date
    add_column :residancies,:publishing_date,:date
    add_column :workshops,:publishing_date,:date
  end
end
