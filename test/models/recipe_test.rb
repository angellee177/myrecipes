require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
    def setup
        @chef = Chef.create!(chef_name: "angellee", email:"angellee@gmail.com")
        @recipe = Recipe.new(name: "Jumbotronnnnn", description: "This was a great vegetables recipes Damn", chef_id: @chef.id)
    end

    test "Recipe without chef should be invalid" do
        @recipe.chef_id = nil
        assert_not @recipe.valid?
    end

    test "Recipe should be valid" do 
        assert @recipe.valid?
    end

    test "Name Should be present" do
        @recipe.name = " "
        assert_not @recipe.valid?
    end

    test "Description Should be present" do
        @recipe.description = " "
        assert_not @recipe.valid?
    end
end