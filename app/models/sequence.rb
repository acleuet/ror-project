class Sequence < ApplicationRecord
  belongs_to :dream
  has_many :place_sequences
  has_many :places, through: :place_sequences
  has_many :character_sequences
  has_many :characters, through: :character_sequences

  scope :owned_by, ->(user) { joins(:dream).where("user_id = ?", user.id) }
end
