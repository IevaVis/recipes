class CocktailsController < ApplicationController
	before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

	def index
		@cocktails = Cocktail.all
	end

	
	def new
		@cocktail = Cocktail.new
	end

	def create
		@cocktail = current_user.cocktails.new(valid_params)
		if params[:non_alcoholic]
			@cocktail.non_alcoholic = true
		else
			@cocktail.non_alcoholic = false
		end
		if @cocktail.save
			redirect_to cocktail_path(@cocktail)
			flash[:notice] = "Cocktail is created successfully."
		else
			flash[:alert] = "Error creating cocktail."
			render :new
		end
	end

	def show
		@cocktail = Cocktail.find(params[:id])
	end

	def edit
		@cocktail = Cocktail.find(params[:id])
	end

	def update
		@cocktail = Cocktail.find(params[:id])
		if @cocktail.update_attributes(valid_params)
			redirect_to cocktail_path(@cocktail)
			flash[:notice] = "Cocktail updated successfully!"
		else
			flash[:alert] = "Error updating cocktail! Try again"
			render :edit
		end
	end

	def destroy
		@cocktail = Cocktail.find(params[:id])
		@cocktail.destroy
		respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render "destroy", locals: {id: @cocktail.id} }  
    end
	end

	private
	def valid_params
		params.require(:cocktail).permit(:title, :ingredients, :preparation, :picture)
	end

	def require_login
		if !logged_in?
			redirect_to root_path
			flash[:notice] = "Please log in to continue!"
		end
	end


end