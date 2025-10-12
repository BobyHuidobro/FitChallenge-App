class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Relaciones faltantes 
  has_many :challenges 
  has_many :participations
  has_many :participated_challenges, through: :participations, source: :challenge
  has_many :progress_entries
  has_many :leaderboards
  has_many :notifications
  has_many :user_badges
  has_many :badges, through: :user_badges
  has_many :scoring_rules
  
  # Validates
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true
end