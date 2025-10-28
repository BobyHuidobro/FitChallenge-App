class BadgesController < ApplicationController
    before_action :set_badge, only: [:show, :edit, :update, :destroy]
    # # Requiere la autenticacion de admin  para eeditar, crear, delete
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

    def index
        @badges = Badge.all
    end
    def show
    end

    def new
        @badge = Badge.new
    end

    def create
        @badge = Badge.new(badge_params)
        if @badge.save
            redirect_to @badge, notice: 'Badge created successfully.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @badge.update(badge_params)
            redirect_to @badge, notice: 'Badge updated successfully.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @badge.destroy
        redirect_to badges_path, notice: 'Badge deleted.'
    end

    private
    def set_badge
        @badge = Badge.find(params[:id])
    end

    def badge_params
        params.require(:badge).permit(:name, :description, :icon_url)
    end

    def require_admin
        unless current_user&.role_admin?
            redirect_to badges_path, alert: 'No tienes permisos para realizar esa acción.'
        end
    end
end
