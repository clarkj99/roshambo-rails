class PlayersController < ApplicationController
  before_action :require_login, only: [:destroy]

  def index
    @players = Player.all
  end

  def new
  end

  def show
    @player = Player.find_by(id: params[:id])
    @battles = @player.battles.select { |battle| battle.moves.count == 2 }
  end

  def create
    @player = Player.new(player_params)
    @player.current_level = 0
    if @player.valid?
      @player.save
      session[:player_id] = @player.id
      flash[:success] = "Player created successfully!"
      redirect_to root_path
    else
      # flash[:danger] = "Creation failed!"
      flash[:danger] = @player.errors.full_messages.first
      redirect_to new_player_path
    end
  end

  def edit
    @player = Player.find_by(id: params[:id])
  end

  def update
    @player = Player.find_by(id: params[:id])
    @player.update(player_params)
    if @player.valid?
      flash[:success] = "Update Player successful!"
      redirect_to @player
    else
      flash[:danger] = @player.errors.full_messages.first
      redirect_to edit_player_path
    end
  end

  def destroy
    @player = Player.find_by(id: params[:id])
    session.delete(:player_id)
    @player.destroy
    flash[:success] = "Player destroyed!"
    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:username, :display_name, :password, :password_confirmation)
  end
end
