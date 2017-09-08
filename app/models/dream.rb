class DateValidator < ActiveModel::Validator
  def validate(dream)
    if Dream.where(date: dream.date).where(user_id: dream.user).count > 0
      dream.errors[:date] << I18n.t("dream.errors.date_already_taken")
    end
  end
end

class Dream < ApplicationRecord
  has_many :sequences, dependent: :destroy
  has_many :characters, through: :sequences
  has_many :places, through: :sequences
  belongs_to :user, required: true

  validates :feeling, inclusion: { in: %w(happy meh frown) }
  validates_with DateValidator
  scope :owned_by, ->(user) { where("user_id = ?", user.id) }

  def characters_count
    self.characters.length
  end

  def sequences_count
    self.sequences.length
  end

  def places_count
    self.places.length
  end

  def short_description
    {
      id: self.id,
      date: self.date,
      sequences_count: self.sequences_count,
      places_count: self.places_count,
      characters_count: self.characters_count,
      feeling: self.feeling
    }
  end
end
