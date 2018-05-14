require 'capybara/rspec'
require 'rails_helper'

describe "the signin process" do
  before :each do
    User.create(name: "john", email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content ('Welcome!')
  end
end




