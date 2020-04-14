class ForgotPasswordsController < ApplicationController
  # GET /forgot_passwords/new
  def new
  end

  # POST /forgot_passwords
  # POST /forgot_passwords.json
  def create
    chef = Chef.find_by(email: params[:email])
    if chef
      chef.update_with_token!
      ChefMailer.with(chef: chef).send_forgot_password.deliver!
      redirect_to forgot_password_confirmation_path
    else
      flash[:error] = params[:email].blank? ? "Email cannot be blank." : "There is no user this email address in the system."
      redirect_to forgot_passwords_path
    end
  end

end
