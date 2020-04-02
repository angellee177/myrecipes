class ForgotPasswordsController < ApplicationController
  before_action :set_forgot_password, only: [:show, :edit, :update, :destroy]

  # GET /forgot_passwords
  # GET /forgot_passwords.json
  def index
    @forgot_passwords = ForgotPassword.all
  end

  # GET /forgot_passwords/1
  # GET /forgot_passwords/1.json
  def show
  end

  # GET /forgot_passwords/new
  def new
    @forgot_password = ForgotPassword.new
  end

  # GET /forgot_passwords/1/edit
  def edit
  end

  # POST /forgot_passwords
  # POST /forgot_passwords.json
  def create
    @forgot_password = ForgotPassword.new(forgot_password_params)

    respond_to do |format|
      if @forgot_password.save
        format.html { redirect_to @forgot_password, notice: 'Forgot password was successfully created.' }
        format.json { render :show, status: :created, location: @forgot_password }
      else
        format.html { render :new }
        format.json { render json: @forgot_password.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forgot_passwords/1
  # PATCH/PUT /forgot_passwords/1.json
  def update
    respond_to do |format|
      if @forgot_password.update(forgot_password_params)
        format.html { redirect_to @forgot_password, notice: 'Forgot password was successfully updated.' }
        format.json { render :show, status: :ok, location: @forgot_password }
      else
        format.html { render :edit }
        format.json { render json: @forgot_password.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forgot_passwords/1
  # DELETE /forgot_passwords/1.json
  def destroy
    @forgot_password.destroy
    respond_to do |format|
      format.html { redirect_to forgot_passwords_url, notice: 'Forgot password was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forgot_password
      @forgot_password = ForgotPassword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forgot_password_params
      params.fetch(:forgot_password, {})
    end
end
