class TeamsController < ApplicationController
    def index
        render json: Team.all.as_json( include: [:players])
    end
    
    def show
        render json: Team.find_by(id: params[:id]).as_json(include: [:players])
    end

    def team_profile

        team = Team.find_by(id: params[:id])
        articles = []
        browser = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-notifications --start-maximized --disable-gpu --headless]
        browser.driver.manage.timeouts.implicit_wait = 100 
        browser.goto("https://www.rotoworld.com/basketball/nba/teams/#{team["alias"]}/#{team["market"]}-#{team["name"]}/team-news")
        js_doc = browser.element(css: ".player-news__list").wait_until(&:present?)
        doc = Nokogiri::HTML(js_doc.inner_html)
        headers = doc.css('.player-news-article__header')
        titles = doc.css('.player-news-article__title') 
        news = doc.css('.player-news-article__summary')
        images = doc.css('.player-news-article__photo')
        num_of_articles = titles.length
        num_of_articles.times do |i|
            articles.push({header: headers[i].text, body: news[i].text, headline: titles[i].text, image: images[i].attribute('src').value})
        end
        browser.close
        render json: {team: team.as_json(:include => :players), articles: articles}
    end

end
