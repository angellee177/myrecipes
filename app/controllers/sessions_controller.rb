class SessionsController < ApplicationController
    def new
    end

    def create
       chef = Chef.find_by(email: params[:session][:email].downcase)
        if chef && chef.authenticate(params[:session][:password])
            session[:chef_id] = chef.id
            flash[:success] = "Ypu Have been Successfully Logged In"
            redirect_to chef
        else
            flash.now[:danger] = "There is something wrong with Your Login Information"
            render 'new'
        end 
    end

    def destroy
        session[:chef_id] = nil
        flash[:success] = "You Have been Logged Out"
        redirect_to root_path
    end

end