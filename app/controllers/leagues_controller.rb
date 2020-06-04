class LeaguesController < ApplicationController
    def index
        render json: League.all.as_json(include: [:teams])
    end
end
