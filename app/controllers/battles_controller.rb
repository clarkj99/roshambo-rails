class BattlesController < ApplicationController
  before_action :find_battle, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    @battlefield = Battlefield.find(params[:battlefield_id])
    @battles = @battlefield.battles.select { |battle| battle.moves.count == 1 }
  end

  def show
  end

  def new
  end

  def create
    @battlefield = Battlefield.find(params[:battlefield_id])
    @battle = @battlefield.battles.build(evolution_level: current_player.current_level)
    byebug
    if @battle.valid?
      @battle.save
      @move = @battle.moves.build(symbol: params[:move], player: current_player)
      if @move.valid?
        @move.save
        flash[:success] = "Challenge was created!"
        # redirect_to battlefield_battles_path(@battlefield)
      else
        flash[:danger] = @battle.errors.full_messages.first
      end
    else
      flash[:danger] = @battle.errors.full_messages.first
      # redirect_to battlefield_battles_path(@battlefield)
    end
    redirect_to battlefield_battles_path(@battlefield)
  end

  d

  def update
    if @battle.update(battle_params)
      redirect_to battle_path(@battle)
    else
      render :edit
    end
  end

  def destroy
    @battle.destroy
  end

  private

  def find_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    # params.require(:battle).permit(:)
  end
end
