class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  ##validates revisar post
  validates :user_id, presence: true, uniqueness: { scope: :challenge_id }
  validates :challenge_id, presence: true

  before_create :set_joined_at

  after_save :update_leaderboard

  def update_leaderboard
    Leaderboard.update_for_challenge(self.challenge)
  end

  def set_joined_at
    self.joined_at ||= Time.current
    self.status ||= 'active'
  end
end
