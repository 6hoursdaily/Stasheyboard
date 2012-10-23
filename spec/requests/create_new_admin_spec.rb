require 'spec_helper'

describe "Admin Dashboard" do

  context 'as non admin' do

    it 'non admin cannot access dashboard' do
      visit new_admin_registration_path
      current_path.should_not == new_admin_registration_path
      current_path.should == root_path
    end

  end

  context 'as admin' do
    # before(:each) do
    #   admin = create(:admin)
    # end
    let(:admin) { create(:admin) }
    subject { admin }


    it 'savvy admin can login through top secret route' do
      visit polkadotmonkey_path
      fill_in 'Email', :with => admin.email
      fill_in 'Password', :with => admin.password
      click_button 'Sign in'
      current_path.should == admin_dashboard_path
    end

    before do
      visit new_admin_session_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Sign in'
    end

    it 'can access new user registration through custom route' do 
      page.should have_content('Admin Dashboard')
      click_link 'Add New Admin User'
      # pending!
    end
  end
end
