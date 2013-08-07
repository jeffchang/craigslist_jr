def find_results
  request = params[:entry]
  if request.include?("main_")
    request.gsub!("main_", "")
    puts request
    @posts = Post.all.select { |post| post.subcategory.maincategory.name == request}
  else
    puts "Else " + request
    @posts = Post.all.select { |post| post.subcategory.name == request}
  end
end