def update_post
  @post_key = params[:num]
  post = Post.where("post_key = ?", @post_key).first
  post.title = params[:title]
  post.description = params[:description]
  post.price = (params[:price].to_f * 100).to_i
  post.email = params[:email]
  cat_name = params[:category].dup
  Maincategory.all.each do |category|
    if category.name == cat_name
      subcat = Subcategory.where("maincategory_id = ?", category.id).sample
      cat_name = subcat.name
    end
  end
  post.subcategory = Subcategory.where("name = ?", cat_name).first
  post.save
  @category = post.subcategory.name
  @post_id = post.id
end