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
class Library < ApplicationRecord
  acts_as_paranoid

  has_many :assets
  belongs_to :creator, class_name: "User"

  validates :name, presence: true

  def self.alphabetical
    order("name ASC")
  end
end
