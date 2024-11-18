require_relative '../helpers/load_drop_dead'

class GamesController < ApplicationController
  before_action :logged_in_user, only: %i[create play]

  def show
    @game = Game.find(params[:id])
  end

  def play
    sides = params[:sides]
    dice_count = params[:dice_count]
    player_count = params[:player_count]
    puts("SIDES~~~~~~~~~~~~~~~~~~~ #{sides.blank?}")

    if sides.blank? || dice_count.blank? || player_count.blank?
      puts("222222222SIDES~~~~~~~~~~~~~~~~~~~ #{sides.blank?}")
      flash.now[:danger] = 'invalid input, please input a number for each field'
      render 'static_pages/play', status: :unprocessable_entity
      return
    end

    @playGame = AutoDropDead.new
    @results = @playGame.play_game(sides.to_i, dice_count.to_i, player_count.to_i)
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
