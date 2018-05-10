class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
    	t.belongs_to :user, index: true
    	t.string :title
    	t.text :ingredients
    	t.text :preparation
    	t.boolean :non_alcoholic
    	t.timestamps
    end
  end
end


  	