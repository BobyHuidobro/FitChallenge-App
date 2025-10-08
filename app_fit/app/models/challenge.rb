class Challenge < ApplicationRecord
  belongs_to :user
  belongs_to :scoring_rule
end
