FactoryGirl.define do
  factory :service do
    sequence(:name) { |n| "Server #{n}" }
  end
end