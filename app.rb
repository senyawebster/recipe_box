require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

# CHANGE YOUR DATABASE SCHEMA!

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
  instructions = ['instructions']
  rating = params['rating']
  recipe = Recipe.create({:name => name, :instructions => instructions, :rating => rating})
  # @recipes = Recipe.all()
  # @tags = Tag.all()
  # @ingredients = Ingredient.all()
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
  name = params['name']
  tag_id = params['tag_id']
  ingredient_id = params['ingredient_id']
  instructions = params['instructions']
  rating = params['rating']

  @recipes = Recipe.all()
  @tags = Tag.all()
  @ingredients = Ingredient.all()

  @recipes = Recipe.find(params[:id])
  tag = params['tag']
  ingredient = params['ingredient']
  @tags = Tag.create({:food_type => food_type})
  @ingredients = Ingredient.create({:description => description})
  recipe = Recipe.create({:tag_id => tag, :ingredient_id => ingredient})

  # @recipes = Recipe.all()
  @tags = Tag.all()
  @ingredients = Ingredient.all()


  erb(:recipe_card)
  # redirect('/recipe/'.concat(@recipe))

end
# <------ End Recipe Path ----->
# get '/category/create' do
#   @tags = Tag.all
#   erb(:create_category)
# end
