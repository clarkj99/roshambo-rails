class Battle < ApplicationRecord
  belongs_to :battlefield
  has_many :moves
  has_many :players, through: :moves
end
