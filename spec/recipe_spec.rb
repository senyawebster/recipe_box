require('spec_helper')

describe(Recipe) do

  # it("Will add a recipe with ingredients and instructions") do
  #   ingredient1 = Ingredient.create({:description => "flour, olive oil"})
  #   recipe1 = Recipe.create({:name => "Pizza", :tag_id => nil, :ingredient_id => ingredient1.id, :instructions => "put in oven", :rating => 5})
  #   expect(recipe1.ingredient_id).to(eq(ingredient1.id))
  # end

  it { should belong_to(:ingredient) }

  it { should belong_to(:tag) }

end
