# == Schema Information
#
# Table name: libraries
#
#  id           :integer          not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  assets_count :integer          default(0)
#  creator_id   :integer
#  deleted_at   :time
#

FactoryGirl.define do
  factory :library do
    name { Faker::Company.name }
    # account
    # creator { account.owner if account }

    factory :invalid_library do
      name nil
    end
  end
end
