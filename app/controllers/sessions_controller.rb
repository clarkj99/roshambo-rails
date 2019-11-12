class SessionsController < ApplicationController
  def new
  end

  def create
    @player = Player.find_by(username: params[:player][:username])
    if @player.authenticate(params[:player][:password])
      flash[:notice] = "Welcome, #{@player.username}!"
      session[:player_id] = @player.id
      redirect_to root_path
    else
      flash[:errors] = "Sorry, your credentials are bad."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:player_id)
    redirect_to root_path
  end
end
