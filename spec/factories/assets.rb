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

FactoryGirl.define do
  factory :asset do
    filename "file.mp4"
    filesize 500
    file_id "123456"
    file_type :video

    association :library
    association :uploader, factory: :user
  end
end
