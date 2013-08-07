get '/' do
  # Look in app/views/index.erb
  pass_categories
  erb :index
end

post '/save' do
  Maincategory.all.each do |category|
    if category.name == params[:category]
      subcat = Subcategory.where("maincategory = ?", category.name).sample
      params[:category] = subcat.name
    end
  end
  saved_post = Post.create({params})
  @post_id = saved_post.id
  erb :thanks
end

get '/search' do
  search_posts
  erb :results
end

post '/posts' do
  pass_categories
  erb :new
end

post '/posts/:num' do
  params[:num]

  erb :update
end

['/:entry', '/:entry/'].each do |path|
  get path do
    find_results
    erb :results
  end
end

get '/:entry/:num' do
  post_num = params[:num]
  @post = Post.find(post_num)
  erb :display
end