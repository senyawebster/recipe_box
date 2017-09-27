require('spec_helper')

describe(Recipe) do
  it("Will add a recipe with ingredients and instructions") do
    test_recipe = Recipe.create({:name => "Pizza", :tag_id => nil, :ingredient_id => nil, :instructions => "put in oven all ingredients, heat, collect insurance so you can buy a pizza", :rating => 5})
    flour_object = Ingredient.create({:description => "flour", :recipe_id => test_recipe.id})
    olive_oil_object = Ingredient.create({:description => "olive oil", :recipe_id => test_recipe.id})

    # binding.pry
    expect(test_recipe.ingredients).to(eq([flour_object, olive_oil_object]))
  end
end
