class ItemsController < ApplicationController

   def index
   end

   
   def show
      @category = Category.find(params[:category_id])
      @categoryItems = @category.items
   end

   
   def new
      @categories = Category.find(params[:category_id])
      @categoryItems = @categories.items
   end

   
   def create
      itemToGet = Item.create(item_params)
      itemToGet.save
      currentCat = Category.find(params[:category_id])
      currentCat.items << itemToGet     
      allCurrentItems = currentCat.items.map do |item|
         item
      end
      redirect_to edit_category_item_path(currentCat, allCurrentItems)
   end
   
   def edit
      # @items = Item.find(params[:id])
      @categories = Category.find(params[:category_id])
      @categoryItems = @categories.items
   end

   def destroy
      itemToDestroy = Item.find(params[:id])
      if itemToDestroy.destroy
         # categories id
         currentCat = Category.find(params[:category_id])
         # categories.items id
         currentItems = currentCat.items.map do |item|
            item
         end
         redirect_to edit_category_item_path(currentCat, currentItems)
      end
   end
   
   
   def update
      itemToUpdate = Item.find(params[:id])
      itemToUpdate.update(item_params)
      category = Category.find(params[:category_id])
      redirect_to edit_category_item_path
   end
   
   

   

   private
   
   def item_params
      params.require(:item).permit(:name)
   end
end
