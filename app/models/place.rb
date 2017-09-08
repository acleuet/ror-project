class NameValidator < ActiveModel::Validator
  def validate(place)
    if Place.where(name: place.name).where(user_id: place.user).count > 0
      place.errors[:name] << I18n.t("place.errors.name_already_taken")
    end
  end
end

class Place < ApplicationRecord
  has_many :place_sequences
  belongs_to :user, required: true
  has_many :sequences, through: :place_sequences
  validates :name, length: { minimum: 2 }
  validates_with NameValidator

  scope :owned_by, ->(user) { where("user_id = ?", user.id) }
end
