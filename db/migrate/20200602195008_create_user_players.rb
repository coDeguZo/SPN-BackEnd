class CreateUserPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_players do |t|

      t.timestamps
    end
  end
end
