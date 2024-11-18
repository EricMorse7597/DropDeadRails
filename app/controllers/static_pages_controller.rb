class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def play
    @game = current_user.games.build if logged_in?
  end
end
