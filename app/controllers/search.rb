post '/search' do
	
@user = User.find(session[:user_id])
response = @user.search(params[:entry])
puts response
end