class SearchController < ApplicationController

	def index
		@cocktails = Cocktail.search(params[:search]).order("created_at DESC") if params[:search].present?
		@noalcohol = Cocktail.non_alcoholic if params[:non_alcoholic].present?
		respond_to do |format|
			format.html { 
				render "welcome/index"
			}
			format.json { render json: @noalcohol }
		end
	end
end