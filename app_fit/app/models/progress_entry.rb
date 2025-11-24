class ProgressEntry < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  ##validates revisar post
  validates :user_id, presence: true
  validates :challenge_id, presence: true
  validates :entry_date, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  scope :recent, -> { order(entry_date: :desc).limit(10) }

  before_validation :set_approved_default
  after_save :update_leaderboard

  def set_approved_default
    self.approved = true if approved.nil?
  end

  def update_leaderboard
    # Actualiza los puntos totales de la participación calculando por regla de puntuación
    participation = Participation.find_by(user: user, challenge: challenge)
    return unless participation

    entries = challenge.progress_entries.where(user: user, approved: true)
    total_points = entries.sum { |e| e.challenge.scoring_rule.pts_quantity(e.quantity) + e.legacy_points.to_i }
    participation.update!(total_points: total_points)

    Leaderboard.update_for_challenge(challenge)
  end
end
