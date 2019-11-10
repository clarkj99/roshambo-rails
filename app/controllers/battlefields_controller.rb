class BattlefieldsController < ApplicationController
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
      redirect_to battlefields_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @battlefield.update(battlefield_params)
      redirect_to battlefield_path(@battlefield)
    else
      render :edit
    end
  end

  def destroy
    @battlefield.destroy
  end

  private

  def find_battlefield
    @battlefield = Battlefield.find(params[:id])
  end

  def battlefield_params
    params.require(:battlefield).permit(:name)
  end
end
