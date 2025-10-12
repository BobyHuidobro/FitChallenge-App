class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  ##validates revisar post
  validates :user_id, presence: true
  validates :challenge_id, presence: true
end
