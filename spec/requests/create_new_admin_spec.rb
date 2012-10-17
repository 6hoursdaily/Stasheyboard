require 'spec_helper'

describe "Admin Dashboard" do

  context 'non admin' do

    it 'non admin cannot access dashboard' do
      visit new_user_registration_path
      current_path.should_not == new_user_registration_path
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
      visit '/admin'
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Sign in'
    end