module CocktailsHelper

  def cocktail_owner?(cocktail)
    return logged_in? && current_user.id == cocktail.user_id
  end

end