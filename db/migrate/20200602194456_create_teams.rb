class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :market
      t.string :alias
      t.string :venue
      t.string :url_reference
      t.string :image
      t.string :sport_title
      t.string :team_reference
      t.integer :league_id

      t.timestamps
    end
  end
end
