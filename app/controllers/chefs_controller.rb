class ChefsController < ApplicationController
    before_action :set_chef, only: [:show, :edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy ]
    before_action :require_admin, only: [:destroy]
    def index
        @chefs = Chef.all
    end

    def new
        @chef = Chef.new
    end

    def create
        @chef = Chef.new(chef_params)
        if @chef.save
            session[:chef_id] = @chef.id
            flash[:success] = "Welcome #{@chef.chef_name} to My Recipes App" 
            redirect_to chef_path(@chef)
        else
            render 'new'
        end
    end

    def show
        
        @chef_recipes = @chef.recipes.paginate(page: params[:page], per_page: 5)
    end

    def edit
        
    end

    def update
       
        if @chef.update(chef_params)
            flash[:success] = "Your Profile was Updated Successfully"
            redirect_to chef_path(@chef)
         else 
             render 'edit'
         end
    end

    def destroy
        if !@chef.admin?
            @chef.destroy
            flash[:danger] = "Chef and all Associated Recipes have been deleted"
            redirect_to chefs_path
        end
    end

    private
    def set_chef
        @chef = Chef.find(params[:id])
    end
    def chef_params
        params.require(:chef).permit(:chef_name, :email, :password, :password_confirmation, :picture)
    end

    # Only user who login can edit and destroy, the same user btw
    def require_same_user
        if current_chef != @chef and !current_chef.admin?
            flash[:danger] = "You can only Edit or Delete your own Account"
            redirect_to chefs_path
        end
    end

    # Only admin User who can delete all user
    def require_admin
        if logged_in? && !current_chef.admin?
            flash[:danger] = "only Admin Users can perform that Actions"
            redirect_to root_path
        end
    end
end