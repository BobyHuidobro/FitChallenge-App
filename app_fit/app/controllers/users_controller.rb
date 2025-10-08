class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # INDEX: no es estrictamente necesario salvo si deseas directorio público; si lo implementas, mostrar username y link al perfil.

    def show
        #mostrar participations con partial
        #mostrar progressEntries con partial
        #mostrar userBadges con partial
    end

    private
    def set_user
        @user = User.find params[:id]
    end
end