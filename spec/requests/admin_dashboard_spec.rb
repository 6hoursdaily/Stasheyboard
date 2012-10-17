require 'spec_helper'

describe "Admin Dashboard" do

  context 'non admin' do

    it 'non admin cannot access dashboard' do
      visit admin_dashboard_path
      current_path.should_not == services_path
      current_path.should_not == admin_dashboard_path
      current_path.should == new_admin_session_path
    end
  end

  context 'admin' do
    # before(:each) do
    #   admin = create(:admin)
    # end
    let(:admin) { create(:admin) }
    subject { admin }

    before do
      visit '/admin'
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Sign in'
    end

    it 'is redirected to the dashboard on sign in' do

      current_path.should == admin_dashboard_path
      within 'h1' do
        page.should have_content 'Admin Dashboard'
      end

    end

    it 'has admin dashboard content' do
      page.should have_selector("title", :content => 'Stasheyboard - Admin Dashboard') 
      page.should have_content 'Current Servers'
      page.should have_content 'Add Server'
      page.should have_content 'Add New Admin User'
    end
  end
end