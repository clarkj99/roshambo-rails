class Battlefield < ApplicationRecord
  has_many :battles, dependent: :destroy
  has_many :moves, through: :battles, dependent: :destroy
  has_many :players, through: :battles
  has_many :levels
  belongs_to :creator, class_name: "Player", foreign_key: :creator_id
  validates :name, length: { in: 4..16 }, format: { without: /\s/, message: "must contain no spaces" }, uniqueness: true, presence: true

  def max_level
    if self.players.any?
      self.players.max_by { |player| player.current_level }.current_level
    else
      0
    end
  end
end
