class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_player, :symbol_color, :level_icon, :symbols_list, :formatted_date, :level_icon_span, :move_icon_span

  def current_player
    @current_player ||= Player.find_by(id: session[:player_id]) if session[:player_id]
  end

  def require_login
    if !current_player
      flash[:warning] = "Login required!"
      redirect_to login_path unless current_player
    end
  end

  def battle_in_progress
    # returns open battle for current player
    Battle.all.find { |battle| battle.moves.count == 1 && battle.moves[0].player == current_player }
  end

  def all_battles_in_progress
    #returns all open battles
    Battle.all.select { |battle| battle.moves.count == 1 }
  end

  def symbol_color(plyr:, opnt:)

    # if ((plyr == "rock") && (opnt == "scissors")) || ((plyr == "paper") && (opnt == "rock")) || ((plyr == "scissors") && (opnt == "paper"))
    if winning_symbol?(plyr, opnt)
      "has-text-success"
    else
      "has-text-danger"
    end
  end

  def winning_symbol?(s1, s2)
    if ((s1 == "rock") && (s2 == "scissors")) ||
       ((s1 == "paper") && (s2 == "rock")) ||
       ((s1 == "scissors") && (s2 == "paper"))
      true
    else
      false
    end
  end

  def winning_player(battle)
    if winning_symbol?(battle.moves[0].symbol, battle.moves[1].symbol)
      battle.moves[0].player
    elsif winning_symbol?(battle.moves[1].symbol, battle.moves[0].symbol)
      battle.moves[1].player
    else
      nil
    end
  end

  def level_icon(level: "0")
    icons = ["fas fa-egg", "fas fa-drumstick-bite", "fas fa-dragon", "fas fa-walking", "fas fa-dollar-sign"]
    icons[level.to_i]
  end

  def level_icon_span(level: "0")
    "<span class='icon fa-2x'><i class= '#{level_icon(level: level)}'></i></span>"
  end

  def move_icon_span(plyr:, opnt:)
    "<span class='icon fa-2x #{symbol_color(plyr: plyr.symbol, opnt: opnt.symbol)}'>
            <i class='fas fa-hand-#{plyr.symbol}'></i>
          </span> "
  end

  def symbols_list
    ["rock", "paper", "scissors"]
    # ["rock", "paper", "scissors", "lizard", "spock"]
  end

  def formatted_date(date)
    date.strftime("%m/%d/%Y %I:%M:%S %p")
  end

  def battle_message(battle)
    @div = "<div class='columns box'>"
    @div += "<div class='column has-text-centered'>"
    @div += "#{level_icon_span(level: battle.evolution_level)}"
    @div += "<p>#{formatted_date(battle.created_at)}</p>"

    @div += "</div>"
    @div += "<div class='column has-text-centered'>"
    @div += "#{move_icon_span(plyr: battle.moves[0], opnt: battle.moves[1])}"

    @div += "<p>#{battle.moves[0].player.display_name} </div></p>"
    @div += "<div class='column has-text-centered'>"
    @div += "#{move_icon_span(plyr: battle.moves[1], opnt: battle.moves[0])}"
    @div += "<p>#{battle.moves[1].player.display_name}</p>"
    @div += "</div>"
    @div += "</div>"
  end
end
