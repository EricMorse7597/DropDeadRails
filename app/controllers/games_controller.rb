require_relative '../helpers/load_drop_dead'

class GamesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @playGame = AutoDropDead.new
    @results = @playGame.play_game(params[:sides], params[:dice_count], params[:player_count])
    @game = current_user.game.build(winnerID: @results[:winnerID], winningScore: @results[:winningScore],
                                    playerID: @user.id)

    if @game.save
      flash[:success] = 'Game over!'
      redirect_to root_url
    else
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:side, :dice_count, :player_count)
  end
end
