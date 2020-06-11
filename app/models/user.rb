class User < ApplicationRecord
    has_secure_password
    has_many :user_players, dependent: :destroy
    has_many :players, through: :user_players
    has_many :user_teams, dependent: :destroy
    has_many :teams, through: :user_teams
    has_many :user_bookmarks, dependent: :destroy
end
