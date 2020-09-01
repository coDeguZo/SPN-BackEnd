class HomeNewsController < ApplicationController
  def index
    render json: HomeNews.all
  end

  def show
    render json: HomeNews.find_by(id: params[:id])
  end

end