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
require 'rails_helper'

RSpec.describe Library, :type => :model do
  it "has a valid factory" do
    expect(build(:library)).to be_valid
  end

  it "is invalid without a Name" do
    library = build(:library, name: nil)
    library.valid?
    expect(library.errors[:name]).to include("can't be blank")
  end

  describe "alphabetical" do
    it "returns an alphabetical list of libraries" do
      first_library = create(:library, name: "Bonza")
      second_library = create(:library, name: "Zoom Zoom")
      third_library = create(:library, name: "Aardvark")

      expect(Library.alphabetical).to eq([third_library, first_library, second_library])
    end
  end
end
