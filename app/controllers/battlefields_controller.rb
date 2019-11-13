class BattlefieldsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  before_action :find_battlefield, only: [:show, :edit, :delete, :update]

  def index
    @battlefields = Battlefield.all
  end

  def show
  end

  def new
    @battlefield = Battlefield.new
  end

  def create
    @battlefield = Battlefield.new(battlefield_params)

    if @battlefield.valid?
      @battlefield.save
      flash[:success] = "Battlefield created!"
      redirect_to battlefields_path
    else
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
