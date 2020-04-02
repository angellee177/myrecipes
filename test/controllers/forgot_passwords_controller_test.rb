require 'test_helper'

class ForgotPasswordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forgot_password = forgot_passwords(:one)
  end

  test "should get index" do
    get forgot_passwords_url
    assert_response :success
  end

  test "should get new" do
    get new_forgot_password_url
    assert_response :success
  end

  test "should create forgot_password" do
    assert_difference('ForgotPassword.count') do
      post forgot_passwords_url, params: { forgot_password: {  } }
    end

    assert_redirected_to forgot_password_url(ForgotPassword.last)
  end

  test "should show forgot_password" do
    get forgot_password_url(@forgot_password)
    assert_response :success
  end

  test "should get edit" do
    get edit_forgot_password_url(@forgot_password)
    assert_response :success
  end

  test "should update forgot_password" do
    patch forgot_password_url(@forgot_password), params: { forgot_password: {  } }
    assert_redirected_to forgot_password_url(@forgot_password)
  end

  test "should destroy forgot_password" do
    assert_difference('ForgotPassword.count', -1) do
      delete forgot_password_url(@forgot_password)
    end

    assert_redirected_to forgot_passwords_url
  end
end
