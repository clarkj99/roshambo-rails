class Move < ApplicationRecord
  belongs_to :player
  belongs_to :battle
  validates :symbol, inclusion: { in: %w(rock paper scissors lizard spock) }
end
