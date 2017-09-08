FactoryGirl.define do
  factory :place do
    association :user
    name "MyString"
  end
end
