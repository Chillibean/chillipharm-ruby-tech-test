# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  activated              :boolean          default(FALSE)
#  activation_date        :date
#  chillibean_staff       :boolean
#  company                :string
#  deleted_at             :datetime
#  email                  :string
#  force_password_change  :boolean          default(FALSE)
#  job_title              :string
#  last_password_digest   :string
#  name                   :string
#  password_digest        :string
#  password_reset_date    :date
#  phone                  :string
#  suspended              :boolean          default(FALSE)
#  timezone               :string
#  token                  :string
#  created_at             :datetime
#  updated_at             :datetime
#  avatar_file_id         :string
#  cropped_avatar_file_id :string
#  legacy_id              :string
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
