require 'spec_helper'

describe "Admin Dashboard" do

  context 'non admin' do

    it 'non admin cannot access dashboard' do
      visit new_admin_registration_path
      current_path.should_not == new_admin_registration_path
      current_path.should == root_path
    end
  end

  context 'admin' do
    # before(:each) do
    #   admin = create(:admin)
    # end
    let(:admin) { create(:admin) }
    subject { admin }

    before do
      visit new_admin_session_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Sign in'
    end

    it 'admin can access new user registration through custom route' do 
      page.should have_content('Admin Dashboard')
      current_path.should == admin_dashboard_path
      visit polkadotmonkey_path
      current_path.should == 'admin/new_admin_user' 
    end
  end
end
