class CategoriesController < ApplicationController
	before_action :set_category, only: [:edit, :update,:destroy] 

	def index
		@categories = Category.all
	end
	
	def  new
		@category = Category.new
	end	

	def create
		@category = Category.new(category_params)
		if @category.save
  		redirect_to  categories_path 
  	else
  		render :new
  	end
  end

  def edit
  	@category = Category.find(params[:id])
  end	

  def update
  	if @category.update(category_params)
  		redirect_to categories_path 
  	else
  		render :edit	
  	end
  end	

  def destroy
  	if @category.destroy
  		redirect_to categories_path
  	end	
  end	
	
	private
		def category_params
      params.require(:category).permit(:id,:category_type,:description)
		end	

		def set_category
			@category = Category.find(params[:id])
		end


end
