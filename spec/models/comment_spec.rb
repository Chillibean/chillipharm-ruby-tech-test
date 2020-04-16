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
require 'rails_helper'

RSpec.describe Comment do
  it { should belong_to(:asset).counter_cache(true) }
  it { should belong_to(:author).class_name("User") }

  it { should validate_presence_of(:comment) }
  it { should validate_presence_of(:author) }
end
