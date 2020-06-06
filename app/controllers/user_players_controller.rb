class UserPlayersController < ApplicationController
    def index
        render json: UserPlayer.all.as_json(include: [:user, :player => {include: [:team]}])
    end

    def show
        render json: UserPlayer.find_by(id: params[:id]).as_json(include: [:user, :player => {include: [:team]}])
    end

    def create
        player = Player.find_by(id: params["id"])
        user = User.find_by(id: params["id"])
        if !user.players.include?(player)
            UserPlayer.create(user_id: user, player_id: player)
        end
    end

    def destroy
        user_player = UserPlayer.find(params{:id})
        user_player.destroy
        render json: user_player
    end
    
end
