FactoryGirl.define do
  factory :message do
    text Faker::Lorem.sentence
  end
end
