class CategoriesController < ApplicationController
	before_action :set_category, only: [:edit, :update,:destroy] 

	def index
    authorize! :read, Category
		@categories = Category.all
	end
	
	def  new
    authorize! :create, Category
		@category = Category.new
	end	

	def create
    authorize! :create, Category
    @category = Category.new(category_params)
		if @category.save
  		redirect_to  categories_path 
  	else
  		render :new
  	end
  end

  def edit
    authorize! :edit, Category
  	@category = Category.find(params[:id])
  end	

  def update
    authorize! :update, Category
  	if @category.update(category_params)
  		redirect_to categories_path 
  	else
  		render :edit	
  	end
  end	

  def destroy
    authorize! :destroy, Category
  	if @category.destroy
  		redirect_to categories_path
  	end	
  end

  def show
   @category = Category.find(params[:id])
   @rooms = @category.rooms
  end 


 
	
	private
		def category_params
      params.require(:category).permit(:id,:category_type,:description)
		end	

		def set_category
			@category = Category.find(params[:id])
		end


end
