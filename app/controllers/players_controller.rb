class PlayersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def show
    @player = Player.find_by(id: session[:player_id])
  end

  def create
    @player = Player.new(player_params)
    if @player.valid?
      @player.save
      session[:player_id] = @player.id
      redirect_to players_path
    else
      redirect_to players_new_path
    end
  end

  private

  def player_params
    params.require(:player).permit(:username, :display_name, :password, :password_confirmation)
  end
end
