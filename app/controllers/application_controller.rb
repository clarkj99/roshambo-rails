class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_player, :symbol_color, :level_icon

  def current_player
    @current_player ||= Player.find_by(id: session[:player_id]) if session[:player_id]
  end

  def require_login
    flash[:warning] = "Login required!"
    redirect_to login_path unless current_player
  end

  def symbol_color(plyr:, opnt:)
    if ((plyr == "rock") && (opnt == "scissors")) || ((plyr == "paper") && (opnt == "rock")) || ((plyr == "scissors") && (opnt == "paper"))
      "has-text-success"
    else
      ""
    end
  end

  def level_icon(level: "0")
    icons = ["fas fa-egg", "fas fa-drumstick-bite", "fas fa-dragon", "fas fa-walking", "fas fa-dollar-sign"]
    icons[level.to_i]
  end
end
