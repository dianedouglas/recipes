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

  it "should return all recipes matching any tag name from a list of tags" do
    test_recipe = Recipe.create({name: 'Chocolate Cookies', description: 'Put ingredients in and bake.'})
    test_tag = Tag.create({name: 'desert'})
    test_recipe.tags << test_tag
    test_tag2 = Tag.create({name: 'cookie'})
    test_recipe.tags << test_tag2
    test_recipe2 = Recipe.create({name: 'Sugar Cookies', description: 'Put ingredients in and bake.'})
    test_recipe2.tags << test_tag2
    expect(Recipe.search_by_tag("#{test_tag.name} #{test_tag2.name}")).to eq [test_recipe, test_recipe2]
  end
end
