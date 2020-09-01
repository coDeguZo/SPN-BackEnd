# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'nokogiri'
require 'open-uri'
require 'watir'

Team.destroy_all
League.destroy_all
Player.destroy_all
User.destroy_all
UserPlayer.destroy_all
UserTeam.destroy_all

league1 = League.create(name: "MLS", logo_img: "https://soccerstadiumdigest.com/wp-content/uploads/2020/01/25th-Season-logo-969x1024.png")
league2 = League.create(name: "NFL", logo_img: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a2/National_Football_League_logo.svg/1200px-National_Football_League_logo.svg.png")
league3 = League.create(name: "NBA", logo_img: "https://a4.espncdn.com/combiner/i?img=%2Fi%2Fespn%2Fmisc_logos%2F500%2Fnba.png")


teams = RestClient.get("http://api.sportradar.us/nba/trial/v7/en/league/hierarchy.json?api_key=3mt6g2wb3zkfm8pebadc78ya")
teams_array = JSON.parse(teams)["conferences"]
teams_array.each do |conference|
    conference["divisions"].each do |division|
        division["teams"].each do |team|
            url = ""
            teamsAbbreviation = {
                atl: 'hawks',
                bkn: 'nets',
                bos: 'celtics',
                cha: 'hornets',
                chi: 'bulls',
                cle: 'cavaliers',
                dal: 'mavericks',
                den: 'nuggets',
                det: 'pistons',
                gsw: 'warriors',
                hou: 'rockets',
                ind: 'pacers',
                lac: 'clippers',
                lal: 'lakers',
                mem: 'grizzlies',
                mia: 'heat',
                mil: 'bucks',
                min: 'timberwolves',
                nop: 'pelicans',
                nyk: 'knicks',
                okc: 'thunder',
                orl: 'magic',
                phi: '76ers',
                phx: 'suns',
                por: 'trail blazers',
                sac: 'kings',
                sas: 'spurs',
                tor: 'raptors',
                uta: 'jazz',
                was: 'wizards'
              }
            url = ""
            teamsAbbreviation.each do |abbreviation|
                url = "http://i.cdn.turner.com/nba/nba/.element/img/1.0/teamsites/logos/teamlogos_500x500/#{abbreviation[0]}.png" if team["name"].downcase === abbreviation[1]
            end

            Team.create(
                name: team["name"],
                market: team["market"],
                alias: team["alias"],
                venue: team["venue"]["name"],
                url_reference: team["id"],
                image: url,
                sport_title: "NBA",
                team_reference: team["reference"],
                league_id: league3.id
            )
        end
    end
end

# teams = RestClient.get("http://api.sportradar.us/nfl/official/trial/v5/en/league/hierarchy.json?api_key=56fc3y9jvaf9sr5ahdvzjcf4")
# teams_array = JSON.parse(teams)["conferences"]
# teams_array.each do |conference|
#     conference["divisions"].each do |division|
#         division["teams"].each do |team|
#              Team.create(
#                 name: team["name"],
#                 market: team["market"],
#                 alias: team["alias"],
#                 venue: team["venue"]["name"],
#                 url_reference: team["id"],
#                 sport_title: "NFL",
#                 team_reference: team["reference"],
#                 league_id: league2.id
#             )
#         end
#     end
# end

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

player1 = Player.all.first
player2 = Player.all.last
player3 = Player.all[2]
player4 = Player.all[3]
player5 = Player.all[4]
player6 = Player.all[5]


user_player = UserPlayer.create(user_id: user1.id, player_id: player1.id)
user_player2 = UserPlayer.create(user_id: user1.id, player_id: player2.id)
user_player3 = UserPlayer.create(user_id: user1.id, player_id: player3.id)
user_player4 = UserPlayer.create(user_id: user1.id, player_id: player4.id)
user_player5 = UserPlayer.create(user_id: user1.id, player_id: player5.id)
user_player6 = UserPlayer.create(user_id: user1.id, player_id: player6.id)

team1 = Team.all.first
team2 = Team.all.last
team3 = Team.all[2]
team4 = Team.all[3]
team5 = Team.all[4]
team6 = Team.all[5]

user_team1 = UserTeam.create(user_id: user1.id, team_id: team1.id)
user_team2= UserTeam.create(user_id: user1.id, team_id: team2.id)
user_team3 = UserTeam.create(user_id: user1.id, team_id: team3.id)
user_team4 = UserTeam.create(user_id: user1.id, team_id: team4.id)
user_team5 = UserTeam.create(user_id: user1.id, team_id: team5.id)

news = RestClient.get("https://newsapi.org/v2/everything?domains=espn.com&pageSize=50&apiKey=f44ccf725ca9471596da059a5defc2fc")
new_parse = JSON.parse(news)["articles"]

new_parse.each do |articles|
    HomeNews.create(
        author: articles["author"],
        content: articles["content"],
        description: articles["description"],
        published_at: articles["publishedAt"],
        title: articles["title"],
        url: articles["url"],
        url_to_image: articles["urlToImage"]
    )
end

news = ["Array"]