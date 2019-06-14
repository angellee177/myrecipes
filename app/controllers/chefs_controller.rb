class ChefsController < ApplicationController
    
    def new
        @chef = Chef.new
    end

    def create
        @chef = Chef.new(chef_params)
        if @chef.save
            flash[:success] = "Welcome #{@chef.chef_name} to My Recipes App" 
            redirect_to chef_path(@chef)
        else
            render 'new'
        end
    end

    def show
        @chef = Chef.find(params[:id])
    end

    def edit
        @chef = Chef.find(params[:id])
    end

    def update
        @chef = Chef.find(params[:id])
        if @chef.update(chef_params)
            flash[:success] = "Your Profile was Updated Successfully"
            redirect_to chef_path(@chef)
         else 
             render 'edit'
         end
    end

    private
    def chef_params
        params.require(:chef).permit(:chef_name, :email, :password, :password_confirmation)
    end
end