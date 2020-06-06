class UserPlayer < ApplicationRecord
    belongs_to :user
    belongs_to :player
    # accepts_nested_attributes_for :player
end
