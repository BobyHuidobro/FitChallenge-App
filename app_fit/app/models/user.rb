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

  enum :role, {
    normal: 0,
    admin: 1,
  }, prefix: true

  # role stored as integer in DB (see schema). Use enum for convenience with Cancancan
  # Temporarily commenting out enum to isolate a loader/arity error seen at class load.
  # Uncomment after debugging if no error occurs.
  # enum role: { normal: 0, admin: 1 }

  # Note: role column has DB default (0 -> normal). No extra callback to avoid loader issues.

end