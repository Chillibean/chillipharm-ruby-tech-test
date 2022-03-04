# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#  asset_id   :integer
#  author_id  :integer
#
# Indexes
#
#  index_comments_on_asset_id   (asset_id)
#  index_comments_on_author_id  (author_id)
#
class Comment < ApplicationRecord
  acts_as_paranoid

  belongs_to :asset, counter_cache: true
  belongs_to :author, class_name: "User"

  validates :comment, presence: true
  validates :author, presence: true
end
