class ItemsController < ApplicationController

   def index
   end

   
   def show
      @category = Category.find(params[:category_id])
      @categoryItems = @category.items
   end

   
   def new
      @category = Category.find(params[:category_id])
      @categoryItems = @category.items
   end

   
   def create
      itemToGet = Item.create(item_params)
      itemToGet.save
      currentCat = Category.find(params[:category_id])
      currentCat.items << itemToGet
      redirect_to new_category_item_path
   end

   
   def edit
      @category = Category.find(params[:category_id])
      @categoryItems = @category.items
      @items = Item.find(params[:id])
   end


   def update
      itemToUpdate = Item.find(params[:id])
      itemToUpdate.update(item_params)
      category = Category.find(params[:category_id])
      redirect_to edit_category_item_path
   end

   
   def destroy
      itemToDestroy = Item.find(params[:id])
      itemToDestroy.destroy
      
      redirect_to new_category_item_path
   end

   

   private
   
   def item_params
      params.require(:item).permit(:name)
   end
end
