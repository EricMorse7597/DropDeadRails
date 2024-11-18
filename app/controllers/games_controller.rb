require_relative '../helpers/load_drop_dead'

class GamesController < ApplicationController
  before_action :logged_in_user, only: %i[create play]

  def show
    @game = Game.find(params[:id])
  end

  def play
    @playGame = AutoDropDead.new
    @results = @playGame.play_game(params[:sides].to_i, params[:dice_count].to_i, params[:player_count].to_i)
    puts(@results)
    create
  end

  def create
    @game = current_user.games.build(winnerID: @results[:winnerID].to_i, winningScore: @results[:winningScore].to_i,
                                     playerID: session[:id].to_i, settings: "#{params[:sides]},#{params[:dice_count]},#{params[:player_count]}")

    if @game.save
      flash[:success] = 'Game over!'
      redirect_to @game
    else
      flash[:danger] = 'Failure'
      render 'static_pages/home', status: :unprocessable_entity
    end
  end
end
