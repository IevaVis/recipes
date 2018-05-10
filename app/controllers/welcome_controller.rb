class WelcomeController < ApplicationController
	
	def index
		@cocktails = Cocktail.all.order('created_at DESC')
	end
end