def edit_by_key
  @key = params[:num]
  @post = Post.where("post_key = ?", @key).first
end