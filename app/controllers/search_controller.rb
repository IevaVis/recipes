class SearchController < ApplicationController

	def index
		respond_to do |format|
			format.html { 
				@cocktails = Cocktail.search(params[:search]).order("created_at DESC") if params[:search].present?
				render "welcome/index"
			}
			format.json { 
				@noalcohol = Cocktail.non_alcoholic
				render json: @noalcohol
			}
		end
	end
end