class BattlesController < ApplicationController
  before_action :find_battle, only: [:show, :edit, :update, :destroy]
  before_action :find_battlefield, only: [:index, :create, :update]
  before_action :require_login

  def index
    @battles = @battlefield.battles.select { |battle| battle.moves.count == 1 && battle.evolution_level == current_player.current_level && }
    @challenge_battle = battle_in_progress
  end

  def show
  end

  def new
  end

  def create
    @battle = @battlefield.battles.build(evolution_level: current_player.current_level)
    if @battle.valid?
      @battle.save
      @move = @battle.moves.build(symbol: battle_params[:move], player: current_player)
      if @move.valid?
        @move.save
        flash[:success] = "Challenge was created!"
      else
        flash[:danger] = @battle.errors.full_messages.first
      end
    else
      flash[:danger] = @battle.errors.full_messages.first
    end
    redirect_to battlefield_battles_path(@battlefield)
  end

  def update
    @move = @battle.moves.build(symbol: battle_params[:move], player: current_player)

    if @move.valid?
      @move.save
      flash[:success] = "Move was saved!"
    else
      flash[:danger] = @battle.errors.full_messages.first
    end
    redirect_to battlefield_battles_path(@battlefield)
  end

  def destroy
    @battle.destroy
  end

  private

  def find_battle
    @battle = Battle.find_by(id: params[:id])
  end

  def find_battlefield
    @battlefield = Battlefield.find(params[:battlefield_id])
  end

  def battle_params
    params.permit(:battlefield_id, :id, :move)
  end
end
