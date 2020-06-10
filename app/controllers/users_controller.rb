class UsersController < ApplicationController
    def index
        render json: User.all.as_json(include: [:user_players])
    end

    def show
        render json: User.find_by(id: params[:id]).as_json(include: [:user_players])
    end

    def create
        user = User.create(name: params[:name], email: params[:email], image: params[:image], password: params[:password], password_confirmation: params[:password_confirmation])
        if user.valid?
            user.save
            payload = {user_id: user.id}
            token = encode(payload)
            render :json => {user: user, token: token}
        else
            render json: user.errors.full_messages
        end
    end

    def update
        user = User.find(params[:id])
        user.update(name: params[:name], email: params[:email], image: params[:image])
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    def login 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode(payload)
            render :json => {user: user, token: token}
        else 
            render json: {error_message: "User not found"}
        end
    end

    def token_authenticate
        token = request.headers["Authenticate"]
        user = User.find(decode(token)["user_id"])
        render json: user
    end

end
