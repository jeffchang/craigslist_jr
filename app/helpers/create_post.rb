def save_and_create_post
  cat_name = params[:category].dup
  params.delete("category")
  params[:price] = (params[:price].to_f * 100).to_i
  Maincategory.all.each do |category|
    if category.name == cat_name
      subcat = Subcategory.where("maincategory_id = ?", category.id).sample
      cat_name = subcat.name
    end
  end
  params[:subcategory] = Subcategory.where("name = ?", cat_name).first
  params[:post_key] = SecureRandom.hex(12)
  saved_post = Post.create(params)
  @category = params[:subcategory].name
  @post_key = params[:post_key]
  @post_id = saved_post.id
end