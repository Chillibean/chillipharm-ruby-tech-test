# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  asset_id   :integer
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
class Comment < ApplicationRecord
  acts_as_paranoid

  belongs_to :asset, counter_cache: true
  belongs_to :author, class_name: "User"

  validates :comment, presence: true
  validates :author, presence: true
end
