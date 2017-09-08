FactoryGirl.define do
  factory :character do
    association :user
    first_name "Bob"
    last_name "Doe"
  end
end
