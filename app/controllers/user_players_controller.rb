class UserPlayersController < ApplicationController
    def index
        render json: UserPlayer.all
    end

    def show
        render json: UserPlayer.find_by(id: params[:id])
    end
end
