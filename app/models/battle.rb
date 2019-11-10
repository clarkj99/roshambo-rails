class Battle < ApplicationRecord
  belongs_to :battlefield
  has_many :moves
end
