class Player < ApplicationRecord
  has_many :moves
  has_many :battles, through: :moves
  has_many :created_battlefields, class_name: "Battlefield", foreign_key: :creator_id

  has_secure_password

  before_validation :downcase_fields
  validates :username, :display_name, length: { in: 4..16 }, format: { without: /\s/, message: "what??? - must contain no spaces" }, uniqueness: true, presence: true

  private

  def downcase_fields
    self.username.downcase!
  end
end
