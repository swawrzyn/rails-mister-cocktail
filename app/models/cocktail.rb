class Cocktail < ApplicationRecord
  before_validation { self.name = name.downcase unless name.nil? }
  validates :name, uniqueness: true, presence: true, allow_nil: false, allow_blank: false
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end
