class Challenge < ApplicationRecord
  belongs_to :user
  belongs_to :scoring_rule

  has_rich_text :description

  ##relaciones faltantes
  has_many :participations
  has_many :participants, through: :participations, source: :user
  has_many :progress_entries
  has_many :leaderboards

  ##validates
  validates :name, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  ##definiendo el metodo de end <start
  private

  def end_date_after_start_date
    return if end_date.blank? || star_date.blank?

    if end_date < start_date
      errors.add(:end_date, "post start_date") ## editar para mejor
    end
  end

end
