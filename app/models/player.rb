class Player < ApplicationRecord
  has_many :moves
  has_many :battles, through: :moves
  has_secure_password
  before_validation :downcase_fields
  validates :username, :display_name, uniqueness: true, presence: true

  private

  def downcase_fields
    self.username.downcase!
  end
end
