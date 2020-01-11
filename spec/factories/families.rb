FactoryBot.define do
  factory :family do
    name "TestFamily"

    trait :another_user do
      name "TestFamily2"
    end
  end
end
