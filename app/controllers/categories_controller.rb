class CategoriesController < ApplicationController

   def index
      @categories = Category.all
      @eachCat = @categories.map do |category|
                     category
                  end
      @eachCatItem = @eachCat.map do |eaCat|
                        eaCat.items
                     end
   end

   
   def show
      # @categories = Category.find(params[:id])
      # @itemsToGet = @categories.items.map do |item|
      #                   item
      #                end

      if params[:search]
         if Category.where(name: params[:search]).length === 0
            redirect_to '/'
         else
            id = Category.where(name: params[:search])[0].id
            @categories = Category.find(id)
            @itemsToGet = @categories.items.map do |item|
                              item
                           end
         end
      else
         @categories = Category.find(params[:id])
         @itemsToGet = @categories.items.map do |item|
                           item
                        end
      end
   end

   
   def new
      @categories = Category.all
      @items = Item.all

      if @toPrompt === true 
         @prompt = 'Enter existing list / create a new list'
      end
   end

   
   def create
      @category = Category.new(category_params)
      @category.save
      redirect_to new_category_item_path(@category)
   end

   
   def edit
      @categories = Category.find(params[:id])
      @itemsToGet = @categories.items.map do |item|
         item
      end

   end

   
   def update
      catToupdate = Category.find(params[:id])
      catToupdate.update(category_params)
      redirect_to category_path
   end

   
   def destroy
      catTodelete = Category.find(params[:id])
      catTodelete.destroy
      redirect_to categories_path
   end

   private

   def category_params
      params.require(:category).permit(:name)
   end

end
