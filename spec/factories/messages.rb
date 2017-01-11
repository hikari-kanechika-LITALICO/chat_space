require 'ffaker'

FactoryGirl.define do
  factory :message do
    message =(
      text  FFaker::Company
      user_id '1'
      group_id '1'
    )
  end
end
