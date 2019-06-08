class RecipesController < ApplicationController
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
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def destroy
        @recipe.destroy
        flash[:notice] = "Recipe was Deleted Succcessfully!"
        redirect_to recipes_path
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, :description)
    end
end