class PasswordResetsController < ApplicationController
    def show
        chef = Chef.find_by(token: params[:id])
        if chef
          @token = chef.token
        else
          redirect_to expired_token_path unless chef
        end
    end
    
    def create
        @chef = Chef.find_by(token: params[:token]);
        puts(@chef);
        if @chef && @chef.update(password: params[:password], token: nil)
          flash[:success] = "Your password has been changed. Please sign in."
          redirect_to login_path
        elsif @chef
          @token = @chef.token
          flash[:danger] = "Failed to change password"
          render :show
        else
          redirect_to expired_token_path
        end
    end
end
