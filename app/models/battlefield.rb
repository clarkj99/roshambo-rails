class Battlefield < ApplicationRecord
  has_many :battles
  has_many :players, through: :battles
  validates :name, length: { in: 4..16 }, format: { without: /\s/, message: "must contain no spaces" }, uniqueness: true, presence: true

  def max_level
    if self.players.any?
      self.players.max_by { |player| player.current_level }.current_level
    else
      0
    end
  end
end
