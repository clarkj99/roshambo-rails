class BattlefieldsController < ApplicationController
  before_action :require_login, only: [:new, :create, :destroy]
  before_action :find_battlefield, only: [:show, :edit, :destroy, :update]

  def index
    @battlefields = Battlefield.all
    @battles = Battle.all.select { |battle| battle.moves.count == 2 }
  end

  def show
    @battles = @battlefield.battles.select { |battle| battle.moves.count == 2 }
    @all_challenge_battles = @battlefield.battles.select { |battle| battle.moves.count == 1 }
  end

  def new
    @battlefield = Battlefield.new
  end

  def create
    @battlefield = current_player.created_battlefields.build(battlefield_params)

    if @battlefield.valid?
      @battlefield.save
      flash[:success] = "Battlefield created!"
      redirect_to battlefields_path
    else
      flash[:danger] = @battlefield.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if @battlefield.update(battlefield_params)
      flash[:success] = "Update complete"
      redirect_to battlefield_path(@battlefield)
    else
      flash[:danger] = "Update failed"
      render :edit
    end
  end

  def destroy
    @battlefield.destroy

    flash[:success] = "Battlefield destroyed!"
    redirect_to battlefields_path
  end

  def battles
    @battlefield = Battlefield.find(params[:battlefield_id])
    @open_battles = @battlefield.battles.select { |battle| battle.moves.count == 1 }
    render "battles/index"
  end

  private

  def find_battlefield
    @battlefield = Battlefield.find(params[:id])
  end

  def battlefield_params
    params.require(:battlefield).permit(:name)
  end
end
