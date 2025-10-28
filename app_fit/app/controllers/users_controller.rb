class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    load_and_authorize_resource

    # INDEX: no es estrictamente necesario salvo si deseas directorio público; si lo implementas, mostrar username y link al perfil.

    def show
        @participations = @user.participations
        @progress_entries = @user.progress_entries
        @user_badges = @user.user_badges
    end

    private
    def set_user
        @user = User.find params[:id]
    end
end