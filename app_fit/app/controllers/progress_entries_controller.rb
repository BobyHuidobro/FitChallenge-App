class ProgressEntriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_challenge
    before_action :ensure_participant!

    def index
        @entries = @challenge.progress_entries.where(user: current_user).recent
    end

    def new
        @entry = @challenge.progress_entries.build(user: current_user, entry_date: Date.today)
    end

    def create
        puntos = @challenge.scoring_rule.pts_quantity(entry_params[:quantity])
        @entry = @challenge.progress_entries.build(entry_params.merge(user: current_user))
        authorize! :create, @entry if defined?(Ability)
        if @entry.save
            redirect_to challenge_progress_entries_path(@challenge), notice: "Progress recorded."
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def set_challenge
        @challenge = Challenge.find(params[:challenge_id])
    end

    def ensure_participant!
        unless @challenge.participants.exists?(current_user.id)
            redirect_to @challenge, alert: "You must join the challenge to log progress."
        end
    end

    def entry_params
        params.require(:progress_entry).permit(:entry_date, :quantity)
    end
end