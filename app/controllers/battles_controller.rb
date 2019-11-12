class BattlesController < ApplicationController
  before_action :find_battle, only: [:show, :edit, :delete, :update]

  def show
  end

  def new
    @battle = Battle.new
  end

  def create
    @battle = Battle.new(battle_params)

    if @battle.valid?
      @battle.save
      redirect_to battles_path
    else
      render :new
    end
  end

  def edit
  end

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

  def find_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    # params.require(:battle).permit(:)
  end
end
