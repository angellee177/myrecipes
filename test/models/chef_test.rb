require 'test_helper'
class ChefTest < ActiveSupport::TestCase
    def setup
        @chef = Chef.new(chef_name: "Hello test", email: "testing@text.com")
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

    test "Email should be unique and case insensitive" do
        duplicate_chef = @chef.dup 
        duplicate_chef.email = @chef.email.upcase
        @chef.save
        assert_not duplicate_chef.valid?
    end

    test "Email should be lower case before hitting db" do
        mixed_email = "JohN@Example.com"
        @chef.email = mixed_email
        @chef.save
        assert_equal mixed_email.downcase, @chef.reload.email
    end
end