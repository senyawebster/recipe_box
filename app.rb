require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}


get '/' do
  @recipes = Recipe.all
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb(:index)
end

get '/recipe/create' do
  @recipes = Recipe.all
  erb(:create_recipe)
end

post '/recipe/create' do
  name = params['name']
  rating = params['rating']
  recipe = Recipe.create({:name => name, :rating => rating})
  @recipes = Recipe.all()
  @tags = Tag.all()
  @ingredients = Ingredient.all()
  erb(:index)
end

get '/recipe/:id' do
  @recipe = Recipe.find(params[:id])
  @recipes = Recipe.all()
  @tags = Tag.all()
  @ingredients = Ingredient.all()
  erb(:recipe_card)
end

# <----- having trouble isolating categories and ingredients belonging exclusively to one recipe, and then displaying them ----->
post 'recipe/:id' do
  @recipe = Recipe.find(params[:id])
  tag = params['tag']
  ingredient = params['ingrdient']
  # @tags = Tag.create({:food_type => food_type})
  # @ingredients = Ingredient.create({:description => description})
  recipe = Recipe.add({:tag_id => tag, :ingredient_id => ingredient})

  @recipes = Recipe.all()
  @tags = Tag.all()
  @ingredients = Ingredient.all()
  erb(:recipe_card)
end
# <------ End Recipe Path ----->
get '/category/create' do
  @tags = Tag.all
  erb(:create_category)
end
