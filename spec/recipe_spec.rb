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
end
