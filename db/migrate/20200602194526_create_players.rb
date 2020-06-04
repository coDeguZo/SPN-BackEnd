class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :full_name
      t.string :real_team_id
      t.string :jersey_number
      t.string :position
      t.string :height
      t.string :weight
      t.string :birthdate
      t.string :college
      t.string :player_image, default: "https://alumni.crg.eu/sites/default/files/default_images/default-picture_0_0.png"
      t.string :team_draft_id
      t.string :league
      t.string :team_id

      t.timestamps
    end
  end
end