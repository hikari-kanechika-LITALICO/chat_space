FactoryGirl.define do
  factory :user do
    password = Faker::Internet.password
    email  Faker::Internet.email
    name  Faker::Name.name
    password password
    password_confirmation password
  end
end
