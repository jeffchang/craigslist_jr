class ChangeDataTypeForDescription < ActiveRecord::Migration
  def change
    change_column :posts, :description, :text

    remove_column :posts, :category_id

    change_table :posts do |t|
      t.references :subcategory, index: true
    end
  end
end
