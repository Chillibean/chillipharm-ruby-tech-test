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
class Library < ApplicationRecord
  acts_as_paranoid

  has_many :assets
  belongs_to :creator, class_name: "User"

  validates :name, presence: true

  def self.alphabetical
    order("name ASC")
  end
end
