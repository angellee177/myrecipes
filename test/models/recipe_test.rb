require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
    def setup
        @recipe = Recipe.new(name: "Jumbotronnnnn", description: "This was a great vegetables recipes Damn", chef_id:"1")
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