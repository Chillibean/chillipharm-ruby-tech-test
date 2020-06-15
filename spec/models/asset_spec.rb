# == Schema Information
#
# Table name: assets
#
#  id              :integer          not null, primary key
#  filename        :string
#  filesize        :bigint
#  file_id         :string
#  file_type       :integer          default("video")
#  library_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  uploader_id     :integer
#  comments_count  :integer          default(0)
#  soft_deleted_at :datetime
#  mime_type       :string
#  title           :string
#
require 'rails_helper'

RSpec.describe Asset, :type => :model do
  it { should belong_to(:library) }
  it { should belong_to(:uploader) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:filename) }
  it { should validate_presence_of(:library) }
  it { should validate_presence_of(:uploader) }
end
