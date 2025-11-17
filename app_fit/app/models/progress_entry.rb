class ProgressEntry < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  ##validates revisar post
  validates :user_id, presence: true
  validates :challenge_id, presence: true
  validates :entry_date, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  scope :recent, -> { order(entry_date: :desc).limit(10) }

  after_save :update_leaderboard

  def update_leaderboard
    # Actualiza los puntos totales de la participación
    participation = Participation.find_by(user: user, challenge: challenge)
    if participation
      participation.total_points = challenge.progress_entries.where(user: user).sum(:points_awarded)
      participation.save!
    end
  end
end
