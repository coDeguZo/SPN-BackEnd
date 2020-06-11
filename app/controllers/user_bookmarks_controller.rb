class UserBookmarksController < ApplicationController
    def index
        render json: UserBookmark.all.as_json(include: [:user])
    end

    def show
        bookmark = UserBookmark.find(params[:id])
        render json: bookmark.as_json(include: [:user])
    end

    def create
        bookmark = UserBookmark.create(user_bookmarks)
        render json: bookmark.as_json(include: [:user])
    end

    def destroy
        bookmark = UserBookmark.find(params[:id])
        bookmark.destroy
        render json: bookmark
    end

    private

    def user_bookmarks
        params.require(:user_bookmark).permit(:author, :content, :description, :published_at, :title, :url, :urlToImage, :user_id)
    end

end
