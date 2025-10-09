class Challenge < ApplicationRecord
  belongs_to :user
  belongs_to :scoring_rule

  has_rich_text :description
end
