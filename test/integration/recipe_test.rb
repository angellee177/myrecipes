require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chef_name:"angellee", email:"angellee@example.com")
    @recipe = Recipe.create(name: "Vegetable Saute", description:"great vegetables saute, add vegetable and oil", chef: @chef)
    @recipe2 = @chef.recipes.build(name:"chicken saute", description:"great chicken dish")
    @recipe2.save
  end

  test "should get recipes index" do
    get recipes_url
    # assert_response :success
  end

  test "should get Recipes Listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
end
