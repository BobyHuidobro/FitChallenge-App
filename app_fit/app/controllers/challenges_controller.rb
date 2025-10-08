class ChallengesController < ApplicationController
    before_action :set_challenge, only: [:show, :edit, :update, :destroy]

    def index
        @challenges = Challenge.all
    end

    def show
        #implementar leaderboard con un partial
        #mostrar participation con partial
        #mostrar progressEntry con partial
    end

    private

    def set_challenge
        @challenge = Challenge.find params[:id]
    end

    def challenge_params
        params.require(:challenge).permit(:name, :start_date, :end_date, :scoring_rule_id, :visibility, :category)
    end
end
