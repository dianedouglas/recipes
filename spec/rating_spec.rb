require 'spec_helper'

describe Rating do

  it 'should have one recipe.' do
    test_recipe = Recipe.create({name: 'Chocolate Cookies', description: 'Put ingredients in and bake.'})
    test_rating = Rating.create({rating: 5})
    test_recipe.ratings << test_rating
    expect(test_rating.recipe).to eq test_recipe
  end
end
