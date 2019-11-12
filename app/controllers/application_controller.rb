class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_player
    @current_player ||= Player.find(session[:player_id]) if session[:player_id]
  end

  helper_method :current_player

  def require_login
    redirect_to login_path unless current_player
  end
end
