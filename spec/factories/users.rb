FactoryGirl.define do
  factory :user do
    name "Test user"
    sequence(:email) { |n| "user_#{n}@example.com" }
    password 'example_pass'
  end
end
