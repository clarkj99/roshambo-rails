class SessionsController < ApplicationController
  def new
  end

  def create
    @player = Player.find_by(username: params[:player][:username].downcase)
    if @player && @player.authenticate(params[:player][:password])
      # flash[:success] = "Welcome, #{@player.username}!"
      session[:player_id] = @player.id
      redirect_to root_path
    else
      flash[:danger] = "Sorry, your credentials are bad."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:player_id)
    # flash[:success] = "Logged out successfully!"
    redirect_to root_path
  end
end
