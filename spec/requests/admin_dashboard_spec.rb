require 'spec_helper'

describe "Admin Dashboard" do

  context 'as non admin' do

    it 'cannot access dashboard' do
      visit admin_dashboard_path
      current_path.should_not == services_path
      current_path.should_not == admin_dashboard_path
      current_path.should == new_admin_session_path
    end
  end

  context 'as admin' do

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
      within 'h3' do
        page.should have_content 'Admin Dashboard'
      end

    end

    it 'has admin dashboard content' do
      page.should have_selector("title", :content => 'Stasheyboard - Admin Dashboard') 
      page.should have_content 'Current Servers'
      page.should have_content 'Add Server'
      page.should have_content 'Add New Admin User'
    end

    it 'can log out' do
      page.should have_content 'Sign out'
      click_link 'Sign out'
      current_path.should == services_path
    end


    it 'can add a new server' do
      click_link 'Add Server'
      fill_in "Name", with: "Pluto"
      expect {
        click_button "Add Service"
        }.to change { Service.count }.by(1)
      current_path.should == admin_dashboard_path
      page.should have_content "Server has been created. Its current status is 'Up'"
      page.should have_content "Pluto"
    end

    it "can delete a server" do
      current_path.should == admin_dashboard_path
      expect {
        click_button 'Delete Service?'
        }.to change { Service.count }.by(-1)
    end

    it "can update a server status", focus: true do
      current_path.should == admin_dashboard_path
      click_link 'Ulysses'
    end

    it "can add new Admin user" do
      click_link 'Add New Admin User'
      fill_in "Email", with: "newadmin@stasheyboard.com"
      fill_in "Password", with: "topsecret"
      fill_in "Password confirmation", with: "topsecret"
      click_button "Add New Admin"
      current_path.should == admin_dashboard_path
      page.should have_content "New Admin created."
    end

    it "can edit an Admin user" do
      pending
    end
  end
end