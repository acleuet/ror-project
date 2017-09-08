class CharacterNameValidator < ActiveModel::Validator
  def validate(character)
    if character.first_name.empty? && character.last_name.empty?
      character.errors[:first_name] << I18n.t("character.errors.first_name_must_be_defined")
    else
      if Character.where(first_name: character.first_name, last_name: character.last_name).where.not(id: character.id).count > 0
        character.errors[:first_name] << I18n.t("character.errors.name_already_taken")
      end
    end
  end
end

class Character < ApplicationRecord
  has_many :character_sequences
  belongs_to :user, required: true
  has_many :sequences, through: :character_sequences
  validates_with CharacterNameValidator

  scope :owned_by, ->(user) { where("user_id = ?", user.id) }

  def complete_name
    self.first_name+' '+self.last_name
  end
end
