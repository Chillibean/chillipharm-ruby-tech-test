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
end
