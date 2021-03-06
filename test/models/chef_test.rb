require 'test_helper'
class ChefTest < ActiveSupport::TestCase
    def setup
        @chef = Chef.new(chef_name: "Hello test", email: "testing@text.com",
            password: "password", password_confirmation:"password", picture: nil)
    
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

    test "password should be present" do
        @chef.password = @chef.password_confirmation = " "
        assert_not @chef.valid?
    end

    test "Password should be at least 5 Character" do
        @chef.password = @chef.password_confirmation = "x" * 4
        assert_not @chef.valid?
    end

    test "associated recipes should be destroyed" do
        @chef.save
        @chef.recipes.create!(name: "testing delete", 
                        description: "testing delete function")
        assert_difference 'Recipe.count', -1 do
          @chef.destroy
        end
    end
end