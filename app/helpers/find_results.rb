def find_results
  request = params[:entry]
  if request.include?("main_")
    request.gsub!("main_", "")
    @posts = Post.all.select { |post| post.subcategory.maincategory.name == request}
  else
    @posts = Post.all.select { |post| post.subcategory.name == request}
  end
end