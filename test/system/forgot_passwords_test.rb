require "application_system_test_case"

class ForgotPasswordsTest < ApplicationSystemTestCase
  setup do
    @forgot_password = forgot_passwords(:one)
  end

  test "visiting the index" do
    visit forgot_passwords_url
    assert_selector "h1", text: "Forgot Passwords"
  end

  test "creating a Forgot password" do
    visit forgot_passwords_url
    click_on "New Forgot Password"

    click_on "Create Forgot password"

    assert_text "Forgot password was successfully created"
    click_on "Back"
  end

  test "updating a Forgot password" do
    visit forgot_passwords_url
    click_on "Edit", match: :first

    click_on "Update Forgot password"

    assert_text "Forgot password was successfully updated"
    click_on "Back"
  end

  test "destroying a Forgot password" do
    visit forgot_passwords_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forgot password was successfully destroyed"
  end
end
