require 'spec_helper'

describe Service do
  describe "valid service" do
    let(:service) { create(:service) }

    subject { service }

    it { should be_valid }
    it { should respond_to(:name) }
    it { should respond_to(:statuses) }


    it "is invalid without a name" do
      FactoryGirl.build(:service, :name => "").should_not be_valid
    end


    it "is invalid without a unique name" do
      create(:service, name: "uniqueuser@cc.com")
      FactoryGirl.build(:service, :name => "uniqueuser@cc.com").should_not be_valid
    end

  end
end
