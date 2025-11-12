class ProgressEntry < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  ##validates revisar post
  validates :user_id, presence: true
  validates :challenge_id, presence: true
  validates :entry_date, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :points_awarded, presence: true, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  scope :recent, -> { order(entry_date: :desc).limit(10) }
end
