require 'spec_helper'

describe "Admin Sign In " do
  describe "successful sign up" do
    visit '/'
    click_link "Sign in"
    fill_in "Email", :with => "user@cc.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    page.should have_content("You have signed up successfully")
  end
end