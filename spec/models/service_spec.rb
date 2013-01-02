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

    # convention in Ruby is 'on' for a day, 'at' for at an hour
    describe "service#downtime_on" do
      it "should return correct amount for single downtime" do
        5.times { |n| service.statuses.create!(name: 'Up', created_at: n.hours.ago) }
        last_down = service.statuses.create!(name: 'Down', created_at: 10.minutes.ago)
        last_up = service.statuses.create!(name: 'Up')
        downtime = last_up.created_at - last_down.created_at
        service.downtime_on(Date.today).should == downtime
      end
    end
  end
end
