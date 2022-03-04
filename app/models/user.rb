# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  activated              :boolean          default(FALSE)
#  activation_date        :date
#  chillibean_staff       :boolean
#  company                :string
#  deleted_at             :datetime
#  email                  :string
#  force_password_change  :boolean          default(FALSE)
#  job_title              :string
#  last_password_digest   :string
#  name                   :string
#  password_digest        :string
#  password_reset_date    :date
#  phone                  :string
#  suspended              :boolean          default(FALSE)
#  timezone               :string
#  token                  :string
#  created_at             :datetime
#  updated_at             :datetime
#  avatar_file_id         :string
#  cropped_avatar_file_id :string
#  legacy_id              :string
#
class User < ApplicationRecord
  has_secure_password
  acts_as_paranoid

  PASSWORD_LIFETIME = 90

  has_many :assets
  has_many :libraries, through: :library_users
  has_many :comments
  validates :email, uniqueness: true, presence: true
  validates_email_format_of :email

  before_validation do
    self.email = email.to_s.downcase
  end

  before_create do
    self.token = SecureRandom.uuid
  end

  def fullname
    return name unless name.blank?
    return email
  end
end
