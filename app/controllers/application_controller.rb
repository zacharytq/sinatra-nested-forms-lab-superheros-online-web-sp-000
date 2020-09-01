require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do
      erb :super_hero
    end

    post "/teams" do
      params["team"]["heroes"].each do |hero_data|
        Hero.new(name: hero_data["name"], power: hero_data["power"], bio: hero_data["bio"])
      end

      @team_name = params["team"]["name"]
      @team_motto = params["team"]["motto"]
      @heroes = Hero.all


      erb :team
    end


end
