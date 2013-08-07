def pass_categories
  @main_categories = Maincategory.all
  sub_categories = Subcategory.all
  @subcats_of_main = @main_categories.map { |main_cat| sub_categories.select { |sub_cat| sub_cat.maincategory == main_cat } }
end