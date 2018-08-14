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
      # if length > 0
      redirect_to new_category_item_path

      # else
      #    redirect_to same page



   end

   
   def edit
      @items = Item.find(params[:id])
      @categories = Category.find(params[:category_id])
      @categoryItems = @categories.items

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
