class Leaderboard < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  validates :user_id, uniqueness: { scope: :challenge_id }


  def self.update_for_challenge(challenge)
    # Obtiene todas las participaciones del desafío, ordenadas por puntos descendente
    participations = Participation.where(challenge: challenge).order(total_points: :desc)
    participations.each_with_index do |participation, idx|
      leaderboard = Leaderboard.find_or_initialize_by(challenge: challenge, user: participation.user)
      leaderboard.total_points = participation.total_points
      leaderboard.rank = idx + 1
      leaderboard.save!
    end
  end
  # Devuelve la suma real de puntos del usuario en el challenge
  def dynamic_total_points
    challenge.progress_entries.where(user: user, approved: true).sum do |e|
      e.challenge.scoring_rule.pts_quantity(e.quantity) + e.legacy_points.to_i
    end
  end
end
