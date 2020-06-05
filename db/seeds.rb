# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require "open-uri"

Team.destroy_all
League.destroy_all
Player.destroy_all
User.destroy_all

league1 = League.create(name: "MLS", logo_img: "https://soccerstadiumdigest.com/wp-content/uploads/2020/01/25th-Season-logo-969x1024.png")
league2 = League.create(name: "NFL", logo_img: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a2/National_Football_League_logo.svg/1200px-National_Football_League_logo.svg.png")
league3 = League.create(name: "NBA", logo_img: "https://a4.espncdn.com/combiner/i?img=%2Fi%2Fespn%2Fmisc_logos%2F500%2Fnba.png")


teams = RestClient.get("http://api.sportradar.us/nba/trial/v7/en/league/hierarchy.json?api_key=3mt6g2wb3zkfm8pebadc78ya")
teams_array = JSON.parse(teams)["conferences"]
teams_array.each do |conference|
    conference["divisions"].each do |division|
        division["teams"].each do |team|
             Team.create(
                name: team["name"],
                market: team["market"],
                alias: team["alias"],
                venue: team["venue"]["name"],
                url_reference: team["id"],
                team_reference: team["reference"],
                league_id: league3.id
            )
        end
    end
end

teams = RestClient.get("http://api.sportradar.us/nfl/official/trial/v5/en/league/hierarchy.json?api_key=56fc3y9jvaf9sr5ahdvzjcf4")
teams_array = JSON.parse(teams)["conferences"]
teams_array.each do |conference|
    conference["divisions"].each do |division|
        division["teams"].each do |team|
             Team.create(
                name: team["name"],
                market: team["market"],
                alias: team["alias"],
                venue: team["venue"]["name"],
                url_reference: team["id"],
                team_reference: team["reference"],
                league_id: league2.id
            )
        end
    end
end

# NBA players API seed data
raw_players = RestClient.get("http://data.nba.net/10s/prod/v1/2019/players.json")
new_team = JSON.parse(raw_players)["league"]
#Image API
otherAPI = RestClient.get("https://raw.githubusercontent.com/alexnoob/BasketBall-GM-Rosters/master/2019-20.NBA.Roster.json")
images = JSON.parse(otherAPI)

new_team["standard"].each do |player|
    image = ""
    images["players"].filter do |x|
        image = x["imgURL"] if x["name"] === "#{player['firstName']} #{player['lastName']}"
    end

if image === ""
    image = "https://alumni.crg.eu/sites/default/files/default_images/default-picture_0_0.png"
end

teams = Team.all
team_id = "".to_i
teams.filter do |team|
    team_id = team.id if team["team_reference"] === player["teamId"]
end

Player.create(
    full_name: "#{player['firstName']} #{player['lastName']}",
    real_team_id: player["teamId"],
    jersey_number: player["jersey"],
    position: player["pos"],
    height: "#{player['heightFeet']}'#{player['heightInches']}",
    weight: player["weightPounds"],
    birthdate: player["dateOfBirthUTC"],
    college: player["collegeName"],
    player_image: image,
    team_draft_id: player["draft"]["teamId"],
    league: "NBA",
    team_id: team_id
    )
end

user1 = User.create(name: "Uzoma Ariguzo", email: "demo1@gmail.com", image: "https://avatars3.githubusercontent.com/u/33858127?s=460&u=86b0afa70fbb45a4d176637abe08d13ef20c610a&v=4", password: "password1")
user2 = User.create(name: "user2", email: "demo2@gmail.com", image: "https://avatars3.githubusercontent.com/u/33858127?s=460&u=86b0afa70fbb45a4d176637abe08d13ef20c610a&v=4", password: "password2")
user3 = User.create(name: "user3", email: "demo3@gmail.com", image: "https://avatars3.githubusercontent.com/u/33858127?s=460&u=86b0afa70fbb45a4d176637abe08d13ef20c610a&v=4", password: "password3")
user4 = User.create(name: "user4", email: "demo4@gmail.com", image: "https://avatars3.githubusercontent.com/u/33858127?s=460&u=86b0afa70fbb45a4d176637abe08d13ef20c610a&v=4", password: "password4")