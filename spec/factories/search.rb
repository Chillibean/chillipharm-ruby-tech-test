FactoryGirl.define do
  factory :search do
    sequence(:search_param) { Faker::Lorem.word }
    user
  end
end
