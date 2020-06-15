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
class Asset < ApplicationRecord
  acts_as_paranoid column: :soft_deleted_at

  belongs_to :library, counter_cache: true
  belongs_to :uploader, class_name: "User"
  has_many :comments, -> { includes(:author) }

  enum file_type: [:video, :image, :audio, :document, :unknown]

  validates :filename, presence: true
  validates :library, presence: true
  validates :uploader, presence: true

  scope :title_asc, -> { order(title: :asc) }
  scope :title_desc, -> { order(title: :desc) }
  scope :created_at_asc, -> { order(created_at: :asc) }
  scope :created_at_desc, -> { order(created_at: :desc) }
end
