get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/search' do
  puts params
  erb :index
end

get '/:entry' do
  puts params[:entry]
  erb :index
end