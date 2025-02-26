class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    redirect '/recipes'
  end
  
  get '/recipes' do
    @recipes = Recipe.all
    erb :index  
  end
  
  post '/recipes' do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    
    redirect 'recipes/' + recipe.id.to_s
  end
  
  get '/recipes/new' do
    erb :new
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :recipe
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    
    erb :edit
  end
  
  patch '/recipes/:id/edit' do
    recipe = Recipe.find(params[:id])
    
    recipe.name = params['name']
    recipe.ingredients = params['ingredients']
    recipe.cook_time = params['cook_time']
    
    recipe.save
    
    redirect 'recipes/' + recipe.id.to_s
  end
  
  delete '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.delete
    
    redirect 'recipes'
  end
  
end
