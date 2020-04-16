# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  token           :string
#  timezone        :string
#  deleted_at      :datetime
#

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| Faker::Internet.email + n.to_s }
    password "YoucaLLthatapa$$word"
    activated true
    password_reset_date DateTime.now.to_date

    factory :unactivated_user do
      activated false
    end
    
    factory :invalid_user do
      email nil
    end
  end
end
