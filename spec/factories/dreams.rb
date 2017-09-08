FactoryGirl.define do
  to_create do |instance|
    unless instance.save
      raise "Invalid record: " + instance.errors.full_messages.join(", ")
    end
  end

  factory :dream do
    association :user
    sequence(:date) { |n| (Date.new(2017,12,1) + n.days).to_s }
    name "MyString"
    feeling 'happy'
    remembered true
  end
end
