get '/ingredients' do
  
  erb :ingredients
end

post '/ingredients/:id' do

  @ingredient = Ingredient.new(item: params[:ingredients], recipe_id: params[:id])	

  if @ingredient.save
  	redirect "/recipe/#{params[:id]}"
  else
  	erb :"recipes/show"
  end

 end