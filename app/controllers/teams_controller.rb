class TeamsController < ApplicationController
    def index
        render json: Team.all.as_json( include: [:players])
    end
    
    def show
        render json: Team.find_by(id: params[:id]).as_json(include: [:players])
    end
end
