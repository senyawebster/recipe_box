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
  erb(:create_recipe)
end

get '/category/create' do
  erb(:create_category)
end
