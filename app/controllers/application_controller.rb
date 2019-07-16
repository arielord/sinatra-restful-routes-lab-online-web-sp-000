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
    # @recipe1 = Recipe.create(:name => "Bomb.com Mac and Cheese", :ingredients => "milk, butter, cheese, elbow pasta", :cook_time => "20 minutes")
    # @recipe2 = Recipe.create(:name => "waldorf salad", :ingredients => "apples, cabbage, oil, vinegar", :cook_time => "0")
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
    
    
    erb :edit
  end
  
end
