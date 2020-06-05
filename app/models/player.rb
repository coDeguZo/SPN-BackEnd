class Player < ApplicationRecord
    has_many :user_players
    belongs_to :team
end
