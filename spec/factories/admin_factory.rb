FactoryGirl.define do
  factory :admin do
    email "admin@stasheyboard.com"
    password "password"
    password_confirmation "password"
  end
end