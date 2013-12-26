class HomeController < ApplicationController
  def index
    @newest_games = Game.order('created_at DESC').where(:complete => 1).limit(5).all
    @users_games = current_user.games.order('created_at DESC').where(:complete => 1).uniq.limit(5).all
  end
end
