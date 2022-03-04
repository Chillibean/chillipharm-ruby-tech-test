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
require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is valid without a name" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to_not include("can't be blank")
  end

  it "is invalid without an email"do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email" do
    create(:user, email: "test@example.com")
    user = build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "downcases the users email" do
    user = build(:user, email: "TEST@EXAMPLE.COM")
    user.valid?
    expect(user.email).to eq("test@example.com")
  end

  describe "returns a user's name as a string" do
    context "when they have not set a name" do
      it "returns their email address" do
        user = build(:user, name: nil)
        expect(user.fullname).to eq(user.email)
      end
    end

    context "when they have set a name" do
      it "returns their name" do
        user = build(:user)
        expect(user.fullname).to eq(user.name)
      end
    end
  end
end
