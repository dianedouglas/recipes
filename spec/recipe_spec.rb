require 'rails_helper'

describe Recipe do

it {should validate_presence_of :name}

it {should validate_presence_of :description}

  it "should have many tags" do
    test_recipe = Recipe.create({name: 'Cookies', description: 'Put ingredients in and bake.'})
    test_tag = Tag.create({name: 'desert'})
    test_tag.recipes << test_recipe
    expect(test_tag.recipes).to eq [test_recipe]
  end

  it "should return all recipes with tag matching query tag name." do
    test_recipe = Recipe.create({name: 'Cookies', description: 'Put ingredients in and bake.'})
    test_tag = Tag.create({name: 'desert'})
    test_tag.recipes << test_recipe
    expect(Recipe.search_by_tag(test_tag.name)).to eq [test_recipe]
  end
end
