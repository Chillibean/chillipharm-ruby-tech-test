# == Schema Information
#
# Table name: search
#
#  id           :bigint           not null, primary key
#  search_param :string
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Search, type: :model do
  it "has a valid factory" do
    expect(build(:search)).to be_valid
  end

  it "is invalid without a search_param" do
    search = build(:search, search_param: nil)
    search.valid?
    expect(search.errors[:search_param]).to include("can't be blank")
  end

  it "is invalid without a user_id" do
    search = build(:search, user_id: nil)
    search.valid?
    expect(search.errors[:user_id]).to include("can't be blank")
  end
end
