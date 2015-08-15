class ChangeNewsletterSummaryTypeToText < ActiveRecord::Migration
  def change
  	change_column :newsletters , :summary, :text
  end
end
