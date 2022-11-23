# == Schema Information
#
# Table name: search
#
#  id           :bigint           not null, primary key
#  search_param :string
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Search < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :search_param, presence: true
end
