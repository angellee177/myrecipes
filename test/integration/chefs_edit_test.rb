require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chef_name: "Angel", email: "leexiao62@gmail.com",
           password: "Angellee622", password_confirmation: "Angellee622"),
    @chef2 = Chef.create!(chef_name: "john", email: "john@example.com",
            password: "password", password_confirmation: "password", picture: nil)
    @admin_user = Chef.create!(chef_name: "john2", email: "john2@example.com",
          password: "password", password_confirmation: "password", picture: nil, admin: true)
  end

  test "reject an invalid edit" do
    sign_in_as(@admin_user, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chef_name: " ", 
                                    email: "mashrur@example.com" } }
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "accept valid edit" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chef_name: "angel", 
                                  email: "leexiao62@gmail.com" } }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "angel", @chef.chef_name
    assert_match "leexiao62@gmail.com", @chef.email
  end

  test "Accept Edit attempt by Admin User" do
    sign_in_as(@admin_user, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chef_name: "Angel", 
                                  email: "leexiao62@gmail.com" } }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "Angel", @chef.chef_name
    assert_match "leexiao62@gmail.com", @chef.email
  end

  test "Redirect Edit attempt by Another non-admin User" do 
    sign_in_as(@chef2, "password")
    updated_name = "John Doe"
    updated_email = "Johndoe@example.com"
    patch chef_path(@chef), params: { chef: { chef_name: updated_name, 
                                  email: updated_email } }
    assert_redirected_to chefs_path
    assert_not flash.empty?
    @chef.reload
    assert_match "john", @chef.chef_name
    assert_match "john@example.com", @chef.email
  end 
  
end
