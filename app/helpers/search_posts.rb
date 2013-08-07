def search_posts
  search_term, category = params[:search], params[:category]
  @posts = []
  Post.all.each do |post|
    if category == "all"
      @posts << post if [post.title, post.description, post.email, post.price.to_s].join(" ").include?(search_term)
    else
      @posts << post if ([post.title, post.description, post.email, post.price.to_s].join(" ").include?(search_term) && post.subcategory.maincategory.name == category)
    end
  end
end