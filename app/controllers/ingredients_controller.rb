class IngredientsController < ApplicationController
      before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
      before_action :require_admin, except: [:show, :index]
      def index
        @ingredients = Ingredient.all
      end

      def new
         @ingredient = Ingredient.new
      end

      def create
         @ingredient = Ingredient.new(ingredient_params)
         if @ingredient.save
            flash[:success] = "Ingredient was successfully created"
            redirect_to ingredient_path(@ingredient)
         else
            render 'new'
         end
      end

      def edit
      end

      def update
         @ingredient = Ingredient.find(params[:id])
         if @ingredient.update(ingredient_params)
            flash[:success] = "Ingredient name was update successfully"
            redirect_to @ingredient
         else  
            render 'edit'
         end
      end

      def show
         @ingredient_recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 5)
      end

      private
      # For finding Ingredient ID on show, edit, update and destroy
      def set_ingredient
         @ingredient = Ingredient.find(params[:id])
      end
      
      # For get the Ingredient data
      def ingredient_params
         params.require(:ingredient).permit(:name)
      end

      def require_admin
         if !logged_in? || (logged_in? and !current_chef.admin?)
            flash[:danger] = "Only Admin Users can Perform that Action!"
            redirect_to ingredients_path
         end
      end
end