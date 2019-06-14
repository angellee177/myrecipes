class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update]
    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = Chef.first
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
        params.require(:recipe).permit(:name, :description, :picture)
    end
end