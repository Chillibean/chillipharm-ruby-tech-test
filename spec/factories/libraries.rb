# == Schema Information
#
# Table name: libraries
#
#  id           :bigint           not null, primary key
#  assets_count :integer          default(0)
#  deleted_at   :time
#  name         :string
#  position     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  account_id   :integer
#  creator_id   :integer
#  legacy_id    :string
#
# Indexes
#
#  index_libraries_on_account_id  (account_id)
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
