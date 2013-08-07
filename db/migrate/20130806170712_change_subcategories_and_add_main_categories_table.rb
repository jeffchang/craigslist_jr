class ChangeSubcategoriesAndAddMainCategoriesTable < ActiveRecord::Migration
  def change
    rename_table(:categories, :subcategories)

    create_table :maincategories do |t|
      t.string :name
    end

    change_table :subcategories do |t|
      t.references :maincategory, index: true
    end
  end
end
