require 'rails_helper.rb'

feature 'Creating Cocktail' do  
  scenario 'can create a cocktail' do
    # 1. go to root where will be button to Add New Book:
    visit '/'
    # 2. click on Add New Book button
    click_button 'Add New Cocktail'
    # 3. Fill form - add title
    fill_in 'cocktail_title', with: 'Ulisses'
    fill_in 'cocktail_ingredients', with: 'balbla' 
    fill_in 'cocktail_preparation', with: 'badlka'  
    # 4. Click on submit form button
    click_button 'Save'
    # 5. Then we should be redirected to show page with book details (book title)
    # expect(page).to have_content('Ulisses')
  end
end