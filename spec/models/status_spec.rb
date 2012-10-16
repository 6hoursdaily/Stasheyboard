require 'spec_helper'

describe Status do

  describe "valid status" do
    let(:status) { create(:status) }

    subject { status }

    it { should be_valid }
    it { should respond_to(:name) }
    it { should respond_to(:service) }
    it { should respond_to(:created_at) }
    it { should respond_to(:service_id) }


    it "is invalid without a name" do
      FactoryGirl.build(:status, :name => "").should_not be_valid
    end


    it "is invalid without a service id" do
      FactoryGirl.build(:status, :service_id => nil).should_not be_valid
    end

  end
end
