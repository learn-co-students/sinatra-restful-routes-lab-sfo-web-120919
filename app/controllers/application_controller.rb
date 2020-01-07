class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
     erb :index
  end 

  get '/recipes/new' do
    erb :new
  end 

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show_recipe
  end
  
  delete '/recipes/:id' do
  
     Recipe.find(params[:id]).destroy
     redirect "/recipes"

  end 

  get '/recipes/:id/edit' do 

    @recipe = Recipe.find(params[:id])
    erb :edit_recipe
    
  end 

  patch '/recipes/:id' do 

    recipe = Recipe.find(params[:id])
    recipe.name = params[:name]
    recipe.cook_time = params[:cook_time]
    recipe.ingredients = params[:ingredients]
    recipe.save
    redirect "/recipes/#{recipe.id}"
    
  end 



  post '/recipes' do 
    @recipe = Recipe.create(name: params[:name], cook_time: params[:cook_time], ingredients: params[:ingredients])
    redirect "/recipes/#{@recipe.id}" 
  end
  
  



end
