require 'capybara/rspec'
require 'rails_helper'

    feature 'Creating User' do
      scenario 'User signs up' do
        # visit the User sign up
        visit '/'
        click_link 'Sign Up'
        # expect the page to have a specific text
        expect(page).to have_content('Sign Up')
        # fill in the form
        fill_in 'Name', with: 'ieva'
        fill_in 'Email', with: 'mail@mail.com'
        fill_in 'Password', with: '12345'
        # click the submit button
        click_button 'Save'
        # expect the page that we're sent to have a specific text
        expect(page).to have_content('Account created')
      end
    end

