class ChallengesController < ApplicationController
    before_action :set_challenge, only: [:show]

    def index
        @challenges = Challenge.all
    end

    def show
        # Carga el leaderboard ordenado por rank (o por total_points si rank está vacío)
        @leaderboards = @challenge.leaderboards.includes(:user).order(rank: :asc, total_points: :desc)
        
        # También puedes cargar las participaciones y progress entries si los necesitas
        @participations = @challenge.participations.includes(:user)
        @progress_entries = @challenge.progress_entries.includes(:user).order(entry_date: :desc)
    end

    private

    def set_challenge
        @challenge = Challenge.find params[:id]
    end

    def challenge_params
        params.require(:challenge).permit(:name, :start_date, :end_date, :scoring_rule_id, :visibility, :category)
    end
end
