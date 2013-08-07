class AddFullTitleColumnToMaincategoriesAndSubcategories < ActiveRecord::Migration
  def change
    add_column :maincategories, :full_title, :string

    add_column :subcategories, :full_title, :string
  end
end
