get '/' do
  redirect '/home'
end

get '/home' do
  if session[:user_id]
    erb :_home
  else   
    erb :home
  end
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/"
  else
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    erb :register
  end
end

post '/new' do
  @recipe = Recipe.new(name: params[:recipename])

  if @recipe.save
    redirect "/recipe/#{@recipe.id}"
  else
    erb :new
  end
end

get '/recipe/:id' do
  @recipe = Recipe.find(params[:id])

  erb :"/recipes/show"
end

