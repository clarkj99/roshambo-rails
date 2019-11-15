class Battle < ApplicationRecord
  belongs_to :battlefield
  has_many :moves, dependent: :destroy
  has_many :players, through: :moves
end
