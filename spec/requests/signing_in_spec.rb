require 'spec_helper'

describe "Admin Sign In " do

  # before(:each) do
  #   admin = create(:admin)
  # end


  it 'accesses the dashboard' do
    admin = create(:admin)
    visit '/admin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'

    current_path.should == admin_dashboard_path
    within 'h1' do
      page.should have_content 'Admin Dashboard'
    end
    page.should have_content 'Current Servers'
    page.should have_content 'Add Server'
    page.should have_content 'Add New Admin User'
  end
end