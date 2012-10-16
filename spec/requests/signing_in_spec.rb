require 'spec_helper'

describe "Admin Sign In " do

  let(:admin) { create(:admin) }

  subject { :admin } 

  it 'accesses the dashboard' do
    visit '/admin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'

    current_path.should == admin_dashboard_path
    within 'h1' do
      page.should have_content 'Administration'
    end
    page.should have_content 'Current Servers'
    page.should have_content 'Add Server'
    page.should have_content 'Add New Admin User'
  end
end