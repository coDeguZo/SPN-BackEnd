class PlayersController < ApplicationController
    def index
        render json: Player.all.as_json(include: [:team])
    end

    def show
        render json: Player.find_by(id: params[:id]).as_json(include: [:team])
    end
end
