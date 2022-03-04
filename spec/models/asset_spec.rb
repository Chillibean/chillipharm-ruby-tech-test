# == Schema Information
#
# Table name: assets
#
#  id                        :bigint           not null, primary key
#  checksum                  :string
#  comments_count            :integer          default(0)
#  exif_data                 :json             not null
#  file_type                 :integer          default("video")
#  filename                  :string
#  filesize                  :bigint
#  legacy_filehash           :string
#  legacy_thumbnail_filehash :string
#  media_info                :json             not null
#  mime_type                 :string
#  s3_name                   :string
#  s3_region                 :string
#  s3_thumbnail_path         :string
#  s3_url                    :string
#  soft_deleted_at           :datetime
#  title                     :string
#  created_at                :datetime
#  updated_at                :datetime
#  account_id                :integer
#  file_id                   :string
#  legacy_id                 :string
#  library_id                :integer
#  thumbnail_file_id         :string
#  uploader_id               :integer
#
# Indexes
#
#  index_assets_on_account_id       (account_id)
#  index_assets_on_library_id       (library_id)
#  index_assets_on_soft_deleted_at  (soft_deleted_at)
#  index_assets_on_uploader_id      (uploader_id)
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
