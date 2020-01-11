FactoryBot.define do
  factory :user do
    name "TestUser"
    sequence(:email){ |n| "tester1006#{n}@example.com"}
    password "123456"
    association :family

    trait :another_user do
      name "TestUser2"
      email "another_tester@example.com"
    end
  end
end
