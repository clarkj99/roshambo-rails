class Player < ApplicationRecord
  has_many :moves
  has_many :battles, through: :moves
  has_secure_password
end
