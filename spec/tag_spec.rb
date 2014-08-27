require 'rails_helper'

describe Tag do

  it { should validate_presence_of :name}

  it "should have many recipes" do
    test_recipe = Recipe.create({name: 'Cookies', description: 'Put ingredients in and bake.'})
    test_tag = Tag.create({name: 'desert'})
    test_recipe.tags << test_tag
    expect(test_recipe.tags).to eq [test_tag]
  end
end
