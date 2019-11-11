class Battlefield < ApplicationRecord
  has_many :battles
  has_many :players, through: :battles
  validates :name, uniqueness: true

  def max_level
    if self.players.any?
      self.players.max_by { |player| player.current_level }.current_level
    else
      0
    end
  end
end
