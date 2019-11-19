class Move < ApplicationRecord
  belongs_to :player
  belongs_to :battle
  validates :symbol, inclusion: { in: %w(rock paper scissors lizard spock) }
  validate :battle_cant_have_2_moves_already

  def battle_cant_have_2_moves_already
    if self.battle.players.count > 1
      errors.add("battle already has two moves")
    end
  end
end
