get '/' do
  # Look in app/views/index.erb
  pass_categories
  erb :index
end

post '/create' do
  create_post
  erb :thanks
end

post '/update' do
  update_post
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

get '/edit/:num' do
  pass_categories
  edit_by_key
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