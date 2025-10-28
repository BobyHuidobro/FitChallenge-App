class UserBadgesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
        @user = current_user
        @user_badges = @user.user_badges.includes(:badge).order(awarded_at: :desc)
        @badges = @user_badges.map(&:badge) # Extrae los badges para usar el mismo template
    end
end