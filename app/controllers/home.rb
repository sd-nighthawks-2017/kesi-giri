get '/' do
  redirect '/home'
end

get '/home' do
  erb :home
end

get '/home' do
  erb :home
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

get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    session[:user_id]
    redirect "/login/#{@user.id}"
  else
    erb :register
  end
end

