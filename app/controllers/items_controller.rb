class ItemsController < ApplicationController

   def index

   end

   
   def show

   end

   
   def new
      @categories = Category.all
   end

   
   def create
      itemToGet = Item.create(item_params)
      itemToGet.save
      currentCat = Category.find(Category.all.length)
      currentCat.items << itemToGet
      redirect_to new_item_path
   end

   
   def edit

   end


   def update

   end

   
   def destroy
      Item.find_by(id)
   end

   

   private
   
   def item_params
      params.require(:item).permit(:name)
   end
end
