module BattlefieldsHelper
  def symbol_color(plyr:, opnt:)
    if ((plyr == "rock") && (opnt == "scissors")) || ((plyr == "paper") && (opnt == "rock")) || ((plyr == "scissors") && (opnt == "paper"))
      "has-text-success"
    else
      ""
    end
  end
end
