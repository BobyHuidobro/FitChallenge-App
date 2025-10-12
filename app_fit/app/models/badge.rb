class Badge < ApplicationRecord
    has_rich_text :description
    has_many :user_badges
    has_many :users, through: :user_badges

    ##validates revisar dsp domingo
    validates :name, presence: true, uniqueness: true
end
