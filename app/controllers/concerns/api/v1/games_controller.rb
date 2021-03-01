class Api::V1::GamesController < ApplicationController
    def index
        games = Game.all
        render json: games
    end
  
    def create
        binding.pry
        game = Game.create(game_params)
        render json: game
      
    end

    def destroy
        game = game.find_by(id: params[:id]).destroy
        render json: game
    end

    private
    def game_params
      params.require(:game).permit(:user, :score, :lines, :level)
    end
end
