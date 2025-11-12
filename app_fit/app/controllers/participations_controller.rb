class ParticipationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_challenge
  load_and_authorize_resource :challenge
  load_and_authorize_resource :participation, through: :challenge, shallow: true

  def create
    @participation = @challenge.participations.build(user: current_user)
    authorize! :create, @participation if defined?(Ability)
    if @participation.save
      redirect_to @challenge, notice: "Joined challenge."
    else
      redirect_to @challenge, alert: @participation.errors.full_messages.to_sentence
    end
  end

  def destroy
    @participation = @challenge.participations.find_by!(user: current_user)
    authorize! :destroy, @participation if defined?(Ability)
    @participation.destroy
    redirect_to @challenge, notice: "Left challenge."
  end

  private
  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end
end
