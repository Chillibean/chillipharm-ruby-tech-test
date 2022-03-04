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
require 'rails_helper'

RSpec.describe Comment do
  it { should belong_to(:asset).counter_cache(true) }
  it { should belong_to(:author).class_name("User") }

  it { should validate_presence_of(:comment) }
  it { should validate_presence_of(:author) }
end
