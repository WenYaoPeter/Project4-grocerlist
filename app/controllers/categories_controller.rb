class CategoriesController < ApplicationController

   def index
      @categories = Category.all
      @categories
   end

   
   def show
      @categories = Category.find(params[:id])
      @itemsToGet = @categories.items.map do |item|
                        item
                     end
   end

   
   def new
   end

   
   def create
      @category = Category.new(category_params)
      @category.save
      redirect_to new_item_path
   end

   
   def edit

   end

   
   def update

   end

   
   def destroy

   end

   private

   def category_params
      params.require(:category).permit(:name)
   end

end
