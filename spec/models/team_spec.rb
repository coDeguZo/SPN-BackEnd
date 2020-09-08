require "rails_helper"

# Be sure to run rake db:seed RAILS_ENV=test before running test

RSpec.describe Team, :type => :model do

    it 'has all the NBA teams' do 
        teams = Team.all
        team_length = teams.length
        expect(team_length).to eq(30)
    end

    it 'can create an NBA team and find name' do
      team = Team.create(name: "Uzomas Team",
      market: "Washington D.C",
      alias: "UA",
      venue: "Washington Monument",
      url_reference: 1,
      image: "A Picture Here",
      sport_title: "NBA",
      team_reference: "Uzoma Rocks",
      league_id: 4)
      expect(team.name).to eq("Uzomas Team")
    
    end

end