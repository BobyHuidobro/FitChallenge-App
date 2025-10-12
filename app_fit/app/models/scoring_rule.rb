class ScoringRule < ApplicationRecord
    has_rich_text :description
    belongs_to :user, optional: true
    has_many :challenges

    validates :rule_type, presence: true
end
