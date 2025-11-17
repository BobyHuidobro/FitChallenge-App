class ScoringRule < ApplicationRecord
  has_rich_text :description
  belongs_to :user, optional: true
  has_many :challenges

  validates :rule_type, presence: true

  def pts_quantity(qty)
    return 0 if factor.blank? || unidad.blank? || qty.blank?
    (qty.to_i / unidad.to_i) * factor.to_i
  end
end
