class ChallengesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_challenge, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

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

    def new
        @challenge = current_user.challenges.build
        @scoring_rules = ScoringRule.all
    end

    def create
        @challenge = current_user.challenges.build challenge_params
        @scoring_rules = ScoringRule.all
        if @challenge.save
            redirect_to challenge_path(@challenge)
        else
            # render new to preserve form data and show validation errors
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @scoring_rules = ScoringRule.all
    end

    def update
        if @challenge.update challenge_params
            redirect_to challenge_path(@challenge), notice: "Challenge updated successfully."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
            if @challenge.destroy
                redirect_to challenges_path, notice: "Challenge deleted."
            else
                redirect_to challenge_path(@challenge), alert: (@challenge.errors.full_messages.presence || ["Cannot delete challenge while there are participants."]).to_sentence
            end
    end

    private

    def set_challenge
        @challenge = Challenge.find params[:id]
    end

    def challenge_params
        params.require(:challenge).permit(:name, :start_date, :end_date, :scoring_rule_id, :visibility, :category, :description)
    end
end
