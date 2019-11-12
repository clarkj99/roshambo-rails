class Player < ApplicationRecord
  has_many :moves
  has_many :battles, through: :moves
  has_secure_password
  validates :username, uniqueness: true
  before_save :downcase_fields

  def downcase_fields
    self.username.downcase
  end
end
