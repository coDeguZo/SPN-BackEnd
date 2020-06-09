class UserTeamsController < ApplicationController
    def index
        render json: UserTeam.all.as_json(include: [:user, :team => {include: [:players]}])
    end

    def show
        render json: UserTeam.find_by(id: params[:id]).as_json(include: [:user, :team => {include: [:players]}])
    end

    def create
        user_team = UserTeam.create(user_team_params)
        render json: user_team.as_json(include: [:user, :team => {include: [:players]}])
        
    end

    def destroy
        user_team = UserTeam.find(params[:id])
        user_team.destroy
        render json: user_team
    end
    
    private

    def user_team_params
        params.require(:user_team).permit(:user_id, :team_id)
    end
end
