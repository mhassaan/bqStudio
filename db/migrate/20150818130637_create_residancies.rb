class CreateResidancies < ActiveRecord::Migration
  def change
    create_table :residancies do |t|

      t.timestamps null: false
    end
  end
end
