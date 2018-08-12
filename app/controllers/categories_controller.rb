class CategoriesController < ApplicationController

   def index
      @categories = Category.all
   end

   
   def show
      @categories = Category.find(params[:id])
      @itemsToGet = @categories.items.map do |item|
                        item
                     end
   end

   
   def new
      @categories = Category.all
   end

   
   def create
      @category = Category.new(category_params)
      @category.save
      redirect_to new_category_item_path(@category)
   end

   
   def edit
      @category = Category.find(params[:id])
      @itemsToGet = @category.items.map do |item|
         item
      end
   end

   
   def update
      catToupdate = Category.find(params[:id])
      catToupdate.update(category_params)

   end

   
   def destroy
      catTodelete = Category.find(params[:id])
      catTodelete.destroy
   end

   private

   def category_params
      params.require(:category).permit(:name)
   end

end
