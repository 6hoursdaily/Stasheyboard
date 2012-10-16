require 'spec_helper'

describe Admin::DashboardController do

  let(:admin) { create(:admin) }


  context 'signed in Admin' do

    before do
      sign_in(:admin, admin)
    end

    describe 'GET dashboard#index' do
      it 'returrns http success' do
        get 'index'
        response.should be_success
      end
    end
  end


  context 'non Admin' do
    describe "GET 'index'" do
      it "returns http success" do
        get 'index'
        response.should_not be_success
      end
    end
  end

end
