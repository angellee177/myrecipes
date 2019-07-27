class RecipesController < ApplicationController
    before_action :require_user,except: [:index, :show]
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def index
        @recipes = Recipe.paginate(page: params[:page], per_page: 5)
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = current_chef
        if @recipe.save
            
            flash[:success] = "Recipe was Created Successfully!"
            redirect_to recipes_path(@recipe)
        else 
            render 'new'
        end
    end

    def edit
        
    end

    def update
        
        if @recipe.update(recipe_params)
           flash[:success] = "Recipe was Updated Successfully"
           redirect_to recipe_path(@recipe)
        else 
            render 'edit'
        end
    end

    def show
        @comments = @recipe.comments.all
    end

    def destroy
        Recipe.find(params[:id]).destroy
        flash[:success] = "Recipe was Deleted Succcessfully!"
        redirect_to recipes_path
    end

    private
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, :description, ingredient_ids: []) 
        #Ingredient_id to get all Ingredient Data
    end
    # Only same user who create the Recipe can delete or edit
    def require_same_user
        if current_chef != @recipe.chef and !current_chef.admin?
            flash[:danger] = "You can only edit or delete your own recipes"
            redirect_to recipes_path
        end
    end
end