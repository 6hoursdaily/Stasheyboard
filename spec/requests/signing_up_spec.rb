require 'spec_helper'

feature "Admin Sign fill_inn" do
  scenario "successful sign up" do
    visit '/crazymonky'
    click_link "Sign in"
    fill_in "Email", :with => "user@cc.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    page.should have_content("You have signed up successfully")
  end
end