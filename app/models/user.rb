# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  token           :string
#  timezone        :string
#  deleted_at      :datetime
#
class User < ApplicationRecord
  has_secure_password
  acts_as_paranoid

  PASSWORD_LIFETIME = 90

  has_many :assets
  has_many :libraries, through: :library_users
  has_many :comments
  has_many :search

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
