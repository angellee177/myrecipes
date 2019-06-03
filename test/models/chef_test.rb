require 'test_helper'
class ChefTest < ActiveSupport::TestCase
    def setup
        @chef = Chef.new(chef_name: "Testing Chef", email: "testing@text.com")
    end

    test "Should be Valid" do
        assert @chef.valid?
    end

    test "name should be present" do
         @chef.chef_name = " "
         assert_not @chef.valid?
    end

    test "name should be less than 25 characters" do
        @chef.chef_name = "a" * 31
        assert_not @chef.valid?
    end
end