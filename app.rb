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
  recipe = Recipe.create({:name => name})
  @recipes = Recipe.all()
  @tags = Tag.all()
  @ingredients = Ingredient.all()
  erb(:index)
end

get '/category/create' do
  @tags = Tag.all
  erb(:create_category)
end
